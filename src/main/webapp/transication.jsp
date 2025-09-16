<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Date, java.text.SimpleDateFormat" %>
<%
    // Sample transaction data - in a real application, this would come from a database
    class Transaction {
        public String id;
        public String description;
        public Date date;
        public double amount;
        public String type;
        public String status;
        
        public Transaction(String id, String description, Date date, double amount, String type, String status) {
            this.id = id;
            this.description = description;
            this.date = date;
            this.amount = amount;
            this.type = type;
            this.status = status;
        }
    }
    
    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");
    
    List<Transaction> transactions = new ArrayList<>();
    transactions.add(new Transaction("TXN78901", "Amazon Purchase", new Date(), -89.99, "Shopping", "Completed"));
    transactions.add(new Transaction("TXN78902", "Salary Deposit", new Date(System.currentTimeMillis() - 86400000), 2500.00, "Deposit", "Completed"));
    transactions.add(new Transaction("TXN78903", "Electricity Bill", new Date(System.currentTimeMillis() - 172800000), -120.50, "Utility", "Completed"));
    transactions.add(new Transaction("TXN78904", "Starbucks Coffee", new Date(System.currentTimeMillis() - 259200000), -5.75, "Food", "Completed"));
    transactions.add(new Transaction("TXN78905", "Transfer to John", new Date(System.currentTimeMillis() - 345600000), -200.00, "Transfer", "Completed"));
    transactions.add(new Transaction("TXN78906", "Interest Credit", new Date(System.currentTimeMillis() - 432000000), 12.34, "Interest", "Completed"));
    transactions.add(new Transaction("TXN78907", "Netflix Subscription", new Date(System.currentTimeMillis() - 518400000), -15.99, "Entertainment", "Completed"));
    transactions.add(new Transaction("TXN78908", "ATM Withdrawal", new Date(System.currentTimeMillis() - 604800000), -100.00, "Cash", "Completed"));
    transactions.add(new Transaction("TXN78909", "Google Play Store", new Date(System.currentTimeMillis() - 691200000), -2.99, "Shopping", "Completed"));
    transactions.add(new Transaction("TXN78910", "Refund - Online Store", new Date(System.currentTimeMillis() - 777600000), 45.00, "Refund", "Completed"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(to right, #2c3e50, #4a6491);
            color: white;
            padding: 30px;
            text-align: center;
            position: relative;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .header p {
            opacity: 0.8;
        }

        .back-button {
            position: absolute;
            left: 20px;
            top: 30px;
            color: white;
            font-size: 20px;
            cursor: pointer;
            background: rgba(255, 255, 255, 0.2);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateX(-5px);
        }

        .content {
            padding: 30px;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .filter-group {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 10px 20px;
            background: #f1f3f5;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .filter-btn.active {
            background: #4b6cb7;
            color: white;
        }

        .filter-btn:hover {
            background: #dee2e6;
        }

        .filter-btn.active:hover {
            background: #3a559c;
        }

        .date-filter {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .date-input {
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            font-size: 14px;
        }

        .transactions-summary {
            background: linear-gradient(to right, #00b09b, #96c93d);
            color: white;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 5px 15px rgba(0, 176, 155, 0.3);
        }

        .summary-item {
            text-align: center;
        }

        .summary-item h3 {
            font-size: 14px;
            margin-bottom: 5px;
            opacity: 0.9;
        }

        .summary-item p {
            font-size: 20px;
            font-weight: 600;
        }

        .transactions-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        .transactions-table th {
            background: #4b6cb7;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        .transactions-table tr {
            border-bottom: 1px solid #f1f3f5;
            transition: background 0.3s ease;
        }

        .transactions-table tr:hover {
            background: #f8f9fa;
        }

        .transactions-table td {
            padding: 15px;
        }

        .transaction-date {
            font-weight: 500;
        }

        .transaction-time {
            font-size: 12px;
            color: #6c757d;
        }

        .transaction-description {
            font-weight: 500;
        }

        .transaction-id {
            font-size: 12px;
            color: #6c757d;
        }

        .transaction-amount {
            font-weight: 600;
            text-align: right;
        }

        .transaction-amount.credit {
            color: #28a745;
        }

        .transaction-amount.debit {
            color: #dc3545;
        }

        .transaction-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
        }

        .status-completed {
            background: #e6f7ee;
            color: #00a65a;
        }

        .status-pending {
            background: #fff3cd;
            color: #856404;
        }

        .transaction-type {
            color: #6c757d;
            font-size: 14px;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(to right, #4b6cb7, #182848);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #3a559c, #101d33);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(75, 108, 183, 0.4);
        }

        .btn-secondary {
            background: #f1f1f1;
            color: #2c3e50;
        }

        .btn-secondary:hover {
            background: #e1e1e1;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .filters {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .header {
                padding: 30px 15px 30px 60px;
            }
            
            .back-button {
                left: 15px;
            }
            
            .transactions-table {
                display: block;
                overflow-x: auto;
            }
            
            .transactions-summary {
                flex-direction: column;
                gap: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i>
            </div>
            <h1><i class="fas fa-exchange-alt"></i> Transaction History</h1>
            <p>View your recent transactions and download statements</p>
        </div>
        
        <div class="content">
            <div class="filters">
                <div class="filter-group">
                    <button class="filter-btn active">All</button>
                    <button class="filter-btn">Income</button>
                    <button class="filter-btn">Expense</button>
                    <button class="filter-btn">Last 7 Days</button>
                    <button class="filter-btn">Last 30 Days</button>
                </div>
                <div class="date-filter">
                    <input type="date" class="date-input" id="startDate">
                    <span>to</span>
                    <input type="date" class="date-input" id="endDate">
                    <button class="btn filter-btn">Apply</button>
                </div>
            </div>
            
            <div class="transactions-summary">
                <div class="summary-item">
                    <h3>Total Transactions</h3>
                    <p>10</p>
                </div>
                <div class="summary-item">
                    <h3>Total Income</h3>
                    <p>$2,512.34</p>
                </div>
                <div class="summary-item">
                    <h3>Total Expense</h3>
                    <p>$534.22</p>
                </div>
                <div class="summary-item">
                    <h3>Net Amount</h3>
                    <p>$1,978.12</p>
                </div>
            </div>
            
            <table class="transactions-table">
                <thead>
                    <tr>
                        <th>Date & Time</th>
                        <th>Description</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Transaction t : transactions) { %>
                    <tr>
                        <td>
                            <div class="transaction-date"><%= sdf.format(t.date) %></div>
                            <div class="transaction-time"><%= timeFormat.format(t.date) %></div>
                        </td>
                        <td>
                            <div class="transaction-description"><%= t.description %></div>
                            <div class="transaction-id">ID: <%= t.id %></div>
                        </td>
                        <td>
                            <div class="transaction-type"><%= t.type %></div>
                        </td>
                        <td>
                            <span class="transaction-status status-<%= t.status.toLowerCase() %>"><%= t.status %></span>
                        </td>
                        <td>
                            <div class="transaction-amount <%= t.amount >= 0 ? "credit" : "debit" %>">
                                <%= t.amount >= 0 ? "+$" + String.format("%.2f", t.amount) : "-$" + String.format("%.2f", -t.amount) %>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <div class="action-buttons">
                <button class="btn btn-secondary"><i class="fas fa-print"></i> Print</button>
                <button class="btn btn-primary" onclick="generatePDF()"><i class="fas fa-download"></i> Download as PDF</button>
            </div>
        </div>
    </div>

    <script>
        // Simple animation on page load
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelector('.container').style.opacity = 0;
            document.querySelector('.container').style.transform = 'translateY(20px)';
            
            setTimeout(function() {
                document.querySelector('.container').style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                document.querySelector('.container').style.opacity = 1;
                document.querySelector('.container').style.transform = 'translateY(0)';
            }, 100);
            
            // Set default date values
            const today = new Date();
            const sevenDaysAgo = new Date();
            sevenDaysAgo.setDate(today.getDate() - 7);
            
            document.getElementById('startDate').valueAsDate = sevenDaysAgo;
            document.getElementById('endDate').valueAsDate = today;
        });
        
        // Filter button functionality
        document.querySelectorAll('.filter-btn').forEach(button => {
            button.addEventListener('click', function() {
                if (!this.classList.contains('date-filter')) {
                    document.querySelectorAll('.filter-btn').forEach(btn => {
                        btn.classList.remove('active');
                    });
                    this.classList.add('active');
                }
            });
        });
        
        // Generate PDF function
        function generatePDF() {
            // Using jsPDF with autoTable plugin
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            
            // Add header
            doc.setFillColor(44, 62, 80);
            doc.rect(0, 0, 220, 30, 'F');
            doc.setFontSize(20);
            doc.setTextColor(255, 255, 255);
            doc.text('Transaction History', 105, 17, { align: 'center' });
            
            // Add date
            doc.setFontSize(10);
            doc.setTextColor(200, 200, 200);
            doc.text('Generated on: ' + new Date().toLocaleDateString(), 105, 25, { align: 'center' });
            
            // Add summary section
            doc.setFillColor(240, 240, 240);
            doc.rect(10, 40, 190, 25, 'F');
            doc.setFontSize(12);
            doc.setTextColor(0, 0, 0);
            doc.text('Summary: 10 Transactions | Income: $2,512.34 | Expense: $534.22 | Net: $1,978.12', 15, 50);
            
            // Add transaction table
            doc.autoTable({
                startY: 70,
                head: [['Date', 'Description', 'Type', 'Status', 'Amount']],
                body: [
                    ['Oct 15, 2023', 'Amazon Purchase', 'Shopping', 'Completed', '-$89.99'],
                    ['Oct 14, 2023', 'Salary Deposit', 'Deposit', 'Completed', '+$2,500.00'],
                    ['Oct 13, 2023', 'Electricity Bill', 'Utility', 'Completed', '-$120.50'],
                    ['Oct 12, 2023', 'Starbucks Coffee', 'Food', 'Completed', '-$5.75'],
                    ['Oct 11, 2023', 'Transfer to John', 'Transfer', 'Completed', '-$200.00'],
                    ['Oct 10, 2023', 'Interest Credit', 'Interest', 'Completed', '+$12.34'],
                    ['Oct 09, 2023', 'Netflix Subscription', 'Entertainment', 'Completed', '-$15.99'],
                    ['Oct 08, 2023', 'ATM Withdrawal', 'Cash', 'Completed', '-$100.00'],
                    ['Oct 07, 2023', 'Google Play Store', 'Shopping', 'Completed', '-$2.99'],
                    ['Oct 06, 2023', 'Refund - Online Store', 'Refund', 'Completed', '+$45.00']
                ],
                theme: 'grid',
                headStyles: {
                    fillColor: [75, 108, 183],
                    textColor: 255
                },
                alternateRowStyles: {
                    fillColor: [240, 240, 240]
                },
                columnStyles: {
                    4: { cellWidth: 25, halign: 'right' }
                },
                didDrawCell: function(data) {
                    if (data.section === 'body' && data.column.index === 4) {
                        const amount = data.cell.raw;
                        if (amount.startsWith('-')) {
                            doc.setTextColor(220, 53, 69);
                        } else {
                            doc.setTextColor(40, 167, 69);
                        }
                    }
                }
            });
            
            // Add footer
            const pageCount = doc.internal.getNumberOfPages();
            for (let i = 1; i <= pageCount; i++) {
                doc.setPage(i);
                doc.setFontSize(10);
                doc.setTextColor(100, 100, 100);
                doc.text('Page ' + i + ' of ' + pageCount, 105, 285, { align: 'center' });
                doc.text('Generated by Global Banking System', 105, 290, { align: 'center' });
            }
            
            // Save the PDF
            doc.save('Transaction-History-' + new Date().toISOString().slice(0, 10) + '.pdf');
        }
    </script>
</body>
</html>