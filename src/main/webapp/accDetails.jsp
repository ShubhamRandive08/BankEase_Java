<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 1000px;
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

        .account-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 25px;
            transition: transform 0.3s ease;
            border-left: 5px solid #4b6cb7;
        }

        .account-card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f1f1f1;
        }

        .account-type {
            font-size: 18px;
            font-weight: 600;
            color: #2c3e50;
        }

        .account-status {
            background: #e6f7ee;
            color: #00a65a;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        .account-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .detail-item {
            margin-bottom: 15px;
        }

        .detail-item label {
            display: block;
            font-size: 12px;
            color: #7b8a9b;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .detail-item span {
            font-size: 16px;
            font-weight: 600;
            color: #2c3e50;
            word-break: break-all;
        }

        /* Professional Card Design */
        .card-details {
            background: linear-gradient(45deg, #2c3e50, #4a6491);
            border-radius: 15px;
            padding: 25px;
            color: white;
            margin-top: 25px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            min-height: 200px;
        }

        .card-details::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
        }

        .card-details::after {
            content: '';
            position: absolute;
            bottom: -60px;
            left: -60px;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
        }

        .card-logo {
            position: absolute;
            top: 20px;
            right: 20px;
            font-weight: bold;
            font-size: 18px;
            color: white;
        }

        .card-chip {
            width: 50px;
            height: 40px;
            background: linear-gradient(135deg, #ffd700, #daa520);
            border-radius: 8px;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .card-chip::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 10px;
            background: rgba(0, 0, 0, 0.2);
            top: 15px;
        }

        .card-number {
            font-size: 22px;
            letter-spacing: 3px;
            margin: 25px 0;
            font-family: 'Courier New', monospace;
            z-index: 1;
            position: relative;
        }

        .card-holder {
            margin-bottom: 5px;
            z-index: 1;
            position: relative;
        }

        .card-holder label {
            font-size: 10px;
            opacity: 0.8;
            display: block;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            z-index: 1;
            position: relative;
        }

        .card-expiry label, .card-cvv label {
            font-size: 10px;
            opacity: 0.8;
            display: block;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
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

        .balance-highlight {
            background: linear-gradient(to right, #00b09b, #96c93d);
            color: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
            font-size: 18px;
            box-shadow: 0 5px 15px rgba(0, 176, 155, 0.3);
        }

        @media (max-width: 768px) {
            .account-details {
                grid-template-columns: 1fr;
            }
            
            .header {
                padding: 30px 15px 30px 60px;
            }
            
            .back-button {
                left: 15px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .card-number {
                font-size: 18px;
                letter-spacing: 2px;
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
            <h1><i class="fas fa-user-circle"></i> Account Details</h1>
            <p>View your account information and card details</p>
        </div>
        
        <div class="content">
            <div class="balance-highlight">
                Available Balance: $12,548.75
            </div>
            
            <div class="account-card">
                <div class="card-header">
                    <div class="account-type">Premium Savings Account</div>
                    <div class="account-status">Active</div>
                </div>
                
                <div class="account-details">
                    <div class="detail-item">
                        <label>Account Holder Name</label>
                        <span>Robert Jonathan Smith</span>
                    </div>
                    
                    <div class="detail-item">
                        <label>Account Number</label>
                        <span>XXXX XXXX XXXX 7532</span>
                    </div>
                    
                    <div class="detail-item">
                        <label>IFSC Code</label>
                        <span>SBIN0123456</span>
                    </div>
                    
                    <div class="detail-item">
                        <label>Branch</label>
                        <span>Main Street Branch</span>
                    </div>
                    
                    <div class="detail-item">
                        <label>Opening Date</label>
                        <span>15/03/2018</span>
                    </div>
                    
                    <div class="detail-item">
                        <label>Account Type</label>
                        <span>Individual</span>
                    </div>
                </div>
                
                <div class="card-details">
                    <div class="card-logo">GLOBAL BANK</div>
                    <div class="card-chip"></div>
                    <div class="card-number">4 2 3 5 •••• •••• 1 8 9 7</div>
                    
                    <div class="card-holder">
                        <label>CARD HOLDER</label>
                        <span>ROBERT J SMITH</span>
                    </div>
                    
                    <div class="card-footer">
                        <div class="card-expiry">
                            <label>VALID THRU</label>
                            <span>05/27</span>
                        </div>
                        <div class="card-cvv">
                            <label>CVV</label>
                            <span>•••</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="action-buttons">
                <button class="btn btn-primary"><i class="fas fa-download"></i> Download Statement</button>
                <button class="btn btn-secondary"><i class="fas fa-share-alt"></i> Share Details</button>
                <button class="btn btn-secondary"><i class="fas fa-print"></i> Print</button>
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
        });
    </script>
</body>
</html>