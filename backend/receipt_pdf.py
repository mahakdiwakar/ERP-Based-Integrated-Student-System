from fpdf import FPDF
from io import BytesIO

class ReceiptPDF(FPDF):
    def header(self):
        # Top banner with Gold and Black theme
        self.set_fill_color(24, 24, 27)  # Luxury Dark Charcoal/Black
        self.rect(0, 0, 210, 45, "F")
        
        # Gold accent line
        self.set_fill_color(212, 175, 55)  # Gold
        self.rect(0, 45, 210, 3, "F")
        
        # College Header Text
        self.set_text_color(212, 175, 55)  # Gold
        self.set_font("Helvetica", "B", 20)
        # We need to print it centered
        self.set_y(10)
        self.cell(0, 12, "SNAPCLASS COLLEGE OF ENGINEERING", align="C", new_x="LMARGIN", new_y="NEXT")
        
        self.set_text_color(255, 255, 255)  # White
        self.set_font("Helvetica", "I", 10)
        self.cell(0, 6, "AIML & Cyber Security Campus · Excellence in Technology", align="C", new_x="LMARGIN", new_y="NEXT")
        self.set_y(48)  # Set Y coordinate below the banner
        self.ln(12)

    def footer(self):
        # Position footer at 2 cm from bottom
        self.set_y(-25)
        # Gold separator
        self.set_fill_color(212, 175, 55)
        self.rect(0, 275, 210, 1, "F")
        
        self.set_text_color(113, 113, 122)  # Muted Gray
        self.set_font("Helvetica", "I", 8)
        self.cell(0, 10, "This is a computer-generated fee receipt. No physical signature is required.", align="C")

def generate_receipt_pdf(student_name, enrollment, department, class_name, total_fee, paid, pending, order_id, payment_id, transaction_id, date_str):
    pdf = ReceiptPDF()
    pdf.add_page()
    
    # Receipt Title
    pdf.set_font("Helvetica", "B", 16)
    pdf.set_text_color(24, 24, 27)
    pdf.cell(0, 10, "OFFICIAL FEE RECEIPT", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.ln(5)
    
    # Columns block
    pdf.set_font("Helvetica", "B", 11)
    pdf.set_text_color(24, 24, 27)
    pdf.cell(95, 8, "STUDENT DETAILS", new_x="RIGHT", new_y="TOP")
    pdf.cell(95, 8, "TRANSACTION DETAILS", new_x="LMARGIN", new_y="NEXT")
    
    pdf.set_font("Helvetica", "", 10)
    pdf.set_text_color(63, 63, 70)
    
    # Save Y position to align columns
    y_start = pdf.get_y()
    
    # Left Column (Student info)
    pdf.set_x(10)
    pdf.cell(95, 6, f"Name: {student_name}", new_x="LMARGIN", new_y="NEXT")
    pdf.cell(95, 6, f"Enrollment: {enrollment}", new_x="LMARGIN", new_y="NEXT")
    pdf.cell(95, 6, f"Department: {department}", new_x="LMARGIN", new_y="NEXT")
    pdf.cell(95, 6, f"Class: {class_name}", new_x="LMARGIN", new_y="NEXT")
    y_left = pdf.get_y()
    
    # Right Column (Transaction info)
    pdf.set_y(y_start)
    pdf.set_x(105)
    pdf.cell(95, 6, f"Date: {date_str}", new_x="RIGHT", new_y="NEXT")
    pdf.set_x(105)
    pdf.cell(95, 6, f"Order ID: {order_id or 'N/A'}", new_x="RIGHT", new_y="NEXT")
    pdf.set_x(105)
    pdf.cell(95, 6, f"Payment ID: {payment_id or 'N/A'}", new_x="RIGHT", new_y="NEXT")
    pdf.set_x(105)
    pdf.cell(95, 6, f"Txn ID: {transaction_id or 'N/A'}", new_x="RIGHT", new_y="NEXT")
    y_right = pdf.get_y()
    
    # Advance Y below both columns
    pdf.set_y(max(y_left, y_right) + 8)
    
    # Fees Summary Table
    # Table Header
    pdf.set_fill_color(24, 24, 27)
    pdf.set_text_color(212, 175, 55)
    pdf.set_font("Helvetica", "B", 10)
    pdf.cell(100, 10, "Description", border=1, align="L", fill=True)
    pdf.cell(90, 10, "Amount (INR)", border=1, align="R", fill=True)
    pdf.ln()
    
    # Table Content
    pdf.set_text_color(63, 63, 70)
    pdf.set_font("Helvetica", "", 10)
    
    pdf.cell(100, 8, "Total Academic Course Fees", border=1, align="L")
    pdf.cell(90, 8, f"Rs. {float(total_fee):,.2f}", border=1, align="R")
    pdf.ln()
    
    pdf.cell(100, 8, "Total Amount Paid", border=1, align="L")
    pdf.cell(90, 8, f"Rs. {float(paid):,.2f}", border=1, align="R")
    pdf.ln()
    
    pdf.set_font("Helvetica", "B", 10)
    pdf.set_text_color(24, 24, 27)
    pdf.cell(100, 8, "Pending Balance Due", border=1, align="L")
    pdf.cell(90, 8, f"Rs. {float(pending):,.2f}", border=1, align="R")
    pdf.ln()
    
    pdf.ln(12)
    
    # Seal block
    pdf.set_draw_color(212, 175, 55)
    pdf.set_fill_color(250, 247, 235)  # Light gold tint
    pdf.rect(10, pdf.get_y(), 190, 24, "DF")
    
    pdf.set_y(pdf.get_y() + 4)
    pdf.set_x(15)
    pdf.set_font("Helvetica", "B", 11)
    pdf.set_text_color(212, 175, 55)
    status_text = "STATUS: FULLY PAID" if float(pending) <= 0 else "STATUS: PARTIALLY PAID"
    pdf.cell(0, 6, status_text, new_x="LMARGIN", new_y="NEXT")
    
    pdf.set_x(15)
    pdf.set_font("Helvetica", "", 9.5)
    pdf.set_text_color(63, 63, 70)
    pdf.cell(0, 6, "Your payment has been successfully processed and recorded in the university database.", new_x="LMARGIN", new_y="NEXT")
    
    buf = BytesIO()
    pdf.output(buf)
    buf.seek(0)
    return buf.getvalue()
