import express from 'express';
import crypto from 'crypto';
import Razorpay from 'razorpay';
import { from } from '../lib/db.js';
import { authMiddleware } from '../lib/auth.js';
import { normalizeFees } from '../lib/fees.js';

const router = express.Router();
router.use(authMiddleware(['student']));

const RAZORPAY_KEY_ID = process.env.RAZORPAY_KEY_ID || '';
const RAZORPAY_KEY_SECRET = process.env.RAZORPAY_KEY_SECRET || '';

const razorpay = RAZORPAY_KEY_ID && RAZORPAY_KEY_SECRET
  ? new Razorpay({ key_id: RAZORPAY_KEY_ID, key_secret: RAZORPAY_KEY_SECRET })
  : null;

function verifyPaymentSignature(orderId, paymentId, signature) {
  const body = `${orderId}|${paymentId}`;
  const expected = crypto
    .createHmac('sha256', RAZORPAY_KEY_SECRET)
    .update(body)
    .digest('hex');
  return expected === signature;
}

router.post('/create-order', async (req, res) => {
  try {
    const { amount, student_id } = req.body;
    const studentId = req.user.id;

    if (student_id != null && Number(student_id) !== studentId) {
      return res.status(403).json({ error: 'Student ID mismatch' });
    }

    const payAmount = Number(amount);
    if (!payAmount || payAmount <= 0) {
      return res.status(400).json({ error: 'Invalid payment amount' });
    }

    const { data: fees } = await from('college_fees')
      .select('*')
      .eq('student_id', studentId)
      .maybeSingle();

    const normalized = normalizeFees(fees);
    if (payAmount > normalized.pending) {
      return res.status(400).json({ error: 'Amount exceeds pending fees' });
    }

    const amountPaise = Math.round(payAmount * 100);
    let orderId;

    if (razorpay) {
      const order = await razorpay.orders.create({
        amount: amountPaise,
        currency: 'INR',
        payment_capture: 1
      });
      orderId = order.id;
    } else {
      orderId = `order_mock_${crypto.randomBytes(6).toString('hex')}`;
    }

    await from('college_fees')
      .update({
        razorpay_order_id: orderId,
        updated_at: new Date().toISOString()
      })
      .eq('student_id', studentId);

    res.json({
      success: true,
      order_id: orderId,
      amount: payAmount,
      key_id: RAZORPAY_KEY_ID || 'rzp_test_mockkey123'
    });
  } catch (e) {
    res.status(500).json({ error: e.message || 'Razorpay order failed' });
  }
});

router.post('/verify', async (req, res) => {
  try {
    const studentId = req.user.id;
    const {
      razorpay_order_id: orderId,
      razorpay_payment_id: paymentId,
      razorpay_signature: signature,
      amount
    } = req.body;

    if (!orderId || !paymentId || !signature) {
      return res.status(400).json({ error: 'Missing payment verification fields' });
    }

    const payAmount = Number(amount);
    if (!payAmount || payAmount <= 0) {
      return res.status(400).json({ error: 'Invalid payment amount' });
    }

    if (razorpay && !orderId.startsWith('order_mock_')) {
      if (!verifyPaymentSignature(orderId, paymentId, signature)) {
        return res.status(400).json({ error: 'Payment signature verification failed' });
      }
    }

    const { data: fees } = await from('college_fees')
      .select('*')
      .eq('student_id', studentId)
      .single();

    if (!fees) {
      return res.status(404).json({ error: 'Fee record not found' });
    }

    const normalized = normalizeFees(fees);
    const newPaid = normalized.paid + payAmount;
    const newPending = Math.max(0, normalized.total - newPaid);
    const status = newPending <= 0 ? 'paid' : 'pending';

    const { data: updated } = await from('college_fees')
      .update({
        paid_amount: newPaid,
        pending_amount: newPending,
        status,
        razorpay_order_id: orderId,
        razorpay_payment_id: paymentId,
        transaction_id: paymentId,
        updated_at: new Date().toISOString()
      })
      .eq('student_id', studentId)
      .select();

    res.json({ success: true, fees: updated[0] });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

export default router;
