<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Your Details - Online ATM</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background: linear-gradient(135deg, #0f1b4d, #1e3a8a, #3b82f6);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow-x: hidden;
        padding: 20px;
    }
    
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    
    .container {
        width: 90%;
        max-width: 500px;
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
        overflow: hidden;
        padding: 40px 30px;
        position: relative;
    }
    
    .security-shape {
        position: absolute;
        top: -70px;
        right: -70px;
        width: 200px;
        height: 200px;
        background: linear-gradient(135deg, #10b981, #059669);
        border-radius: 50%;
        opacity: 0.1;
        z-index: 0;
    }
    
    .header {
        text-align: center;
        margin-bottom: 30px;
        position: relative;
        z-index: 1;
    }
    
    .security-icon {
        width: 100px;
        height: 100px;
        background: linear-gradient(135deg, #10b981, #059669);
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 20px;
        box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3);
    }
    
    .security-icon i {
        font-size: 45px;
        color: white;
    }
    
    h2 {
        color: #059669;
        font-size: 28px;
        margin-bottom: 10px;
        text-align: center;
        font-weight: 700;
    }
    
    .subtitle {
        text-align: center;
        color: #64748b;
        margin-bottom: 30px;
        line-height: 1.6;
        font-size: 16px;
    }
    
    .recovery-steps {
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
        position: relative;
        z-index: 1;
    }
    
    .step {
        text-align: center;
        flex: 1;
        position: relative;
    }
    
    .step-number {
        width: 35px;
        height: 35px;
        background: #3b82f6;
        color: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 10px;
        font-weight: 600;
        font-size: 16px;
    }
    
    .active .step-number {
        background: #10b981;
        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.2);
    }
    
    .completed .step-number {
        background: #10b981;
    }
    
    .step-text {
        font-size: 12px;
        color: #64748b;
        font-weight: 500;
    }
    
    .active .step-text {
        color: #10b981;
        font-weight: 600;
    }
    
    .step-connector {
        position: absolute;
        top: 17px;
        left: 60%;
        width: 70%;
        height: 2px;
        background: #e2e8f0;
        z-index: -1;
    }
    
    .details-container {
        background: #f8fafc;
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 25px;
        border: 1px solid #e2e8f0;
    }
    
    .detail-item {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #e2e8f0;
    }
    
    .detail-item:last-child {
        border-bottom: none;
    }
    
    .detail-label {
        font-weight: 600;
        color: #374151;
    }
    
    .detail-value {
        color: #1e40af;
        font-weight: 500;
    }
    
    .btn-confirm {
        background: linear-gradient(to right, #10b981, #059669);
        color: white;
        border: none;
        padding: 18px;
        border-radius: 12px;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 10px;
        width: 100%;
        text-align: center;
        position: relative;
        overflow: hidden;
        z-index: 1;
        box-shadow: 0 10px 15px rgba(16, 185, 129, 0.2);
    }
    
    .btn-confirm:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 20px rgba(16, 185, 129, 0.3);
    }
    
    .secure-notice {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #16a34a;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        z-index: 1;
        background: #f0fdf4;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #bbf7d0;
    }
    
    .secure-notice i {
        margin-right: 8px;
    }
    
    @media (max-width: 768px) {
        .container {
            padding: 30px 20px;
        }
        
        h2 {
            font-size: 24px;
        }
        
        .security-icon {
            width: 80px;
            height: 80px;
        }
        
        .security-icon i {
            font-size: 35px;
        }
        
        .recovery-steps {
            flex-direction: column;
            gap: 20px;
        }
        
        .step-connector {
            display: none;
        }
        
        .detail-item {
            flex-direction: column;
            gap: 5px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="security-shape"></div>
        
        <div class="header">
            <div class="security-icon">
                <i class="fas fa-user-check"></i>
            </div>
            <h2>Confirm Your Details</h2>
            <p class="subtitle">Please verify your information before proceeding</p>
        </div>
        
        <div class="recovery-steps">
            <div class="step completed">
                <div class="step-number"><i class="fas fa-check"></i></div>
                <div class="step-text">Verify Identity</div>
            </div>
            <div class="step active">
                <div class="step-number">2</div>
                <div class="step-text">Confirm Details</div>
                <div class="step-connector"></div>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <div class="step-text">Reset PIN</div>
            </div>
        </div>
        
        <div class="details-container">
            <div class="detail-item">
                <span class="detail-label">Account Holder Name:</span>
                <span class="detail-value">Rahul Sharma</span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Account Number:</span>
                <span class="detail-value">XXXXXXX7890</span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Card Number:</span>
                <span class="detail-value">XXXX XXXX XXXX 1234</span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Email:</span>
                <span class="detail-value">r*****@gmail.com</span>
            </div>
        </div>
        
        <button type="button" class="btn-confirm" onclick="window.location.href='resetPin.jsp'">
            Confirm & Continue
        </button>
        
        <div class="secure-notice">
            <i class="fas fa-shield-alt"></i> Your details are protected with bank-level security
        </div>
    </div>
</body>
</html>