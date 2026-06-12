/** Normalize college_fees row (supports total_fee and legacy total_fees). */
export function normalizeFees(fees) {
  if (!fees) {
    const total = 50000;
    return { id: null, total, paid: 0, pending: total, status: 'pending' };
  }

  const total = Number(fees.total_fee ?? fees.total_fees ?? 50000);
  const paid = Number(fees.paid_amount ?? 0);
  const pending = fees.pending_amount != null
    ? Number(fees.pending_amount)
    : Math.max(0, total - paid);

  let status;
  if (pending <= 0) status = 'paid';
  else if (paid > 0) status = 'partially_paid';
  else status = fees.status === 'overdue' ? 'overdue' : 'pending';

  return {
    id: fees.id,
    total,
    paid,
    pending,
    status,
    due_date: fees.due_date
  };
}
