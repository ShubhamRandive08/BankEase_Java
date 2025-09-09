<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Secure Online ATM Access</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d);
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
        display: flex;
        flex-direction: row;
        width: 90%;
        max-width: 1000px;
        min-height: 550px;
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
        overflow: hidden;
    }
    
    .left-panel {
        flex: 1;
        background: linear-gradient(to bottom right, #1a2a6c, #2b6cb0);
        color: white;
        padding: 40px 30px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: relative;
        overflow: hidden;
        text-align: center;
    }
    
    .left-panel::before {
        content: "";
        position: absolute;
        width: 200px;
        height: 200px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        top: -50px;
        left: -50px;
    }
    
    .left-panel::after {
        content: "";
        position: absolute;
        width: 300px;
        height: 300px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        bottom: -100px;
        right: -100px;
    }
    
    .bank-logo {
        width: 120px;
        height: 120px;
        background: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 30px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .bank-logo i {
        font-size: 60px;
        color: #1a2a6c;
    }
    
    .left-panel h2 {
        font-size: 28px;
        margin-bottom: 15px;
        text-align: center;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        line-height: 1.3;
    }
    
    .left-panel p {
        text-align: center;
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
        max-width: 300px;
    }
    
    .security-features {
        margin-top: 30px;
        width: 100%;
        max-width: 300px;
    }
    
    .security-features div {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        font-size: 14px;
        text-align: left;
    }
    
    .security-features i {
        margin-right: 10px;
        color: #fdbb2d;
        min-width: 20px;
        text-align: center;
    }
    
    .right-panel {
        flex: 1;
        padding: 40px 30px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    
    .right-panel h2 {
        color: #1a2a6c;
        font-size: 28px;
        margin-bottom: 30px;
        text-align: center;
        line-height: 1.3;
    }
    
    .input-group {
        margin-bottom: 25px;
        position: relative;
    }
    
    .input-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #333;
        text-align: left;
    }
    
    .input-group input {
        width: 100%;
        padding: 15px 15px;
        border: 2px solid #ddd;
        border-radius: 8px;
        font-size: 16px;
        transition: border 0.3s;
    }
    
    .input-group input:focus {
        border-color: #1a2a6c;
        outline: none;
    }
    
    .input-group i {
        position: absolute;
        right: 15px;
        top: 43px;
        color: #777;
    }
    
    .password-toggle {
        cursor: pointer;
    }
    
    .btn-login {
        background: linear-gradient(to right, #1a2a6c, #2b6cb0);
        color: white;
        border: none;
        padding: 15px;
        border-radius: 8px;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
        transition: transform 0.3s, box-shadow 0.3s;
        margin-top: 10px;
        width: 100%;
        text-align: center;
    }
    
    .btn-login:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .additional-options {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        font-size: 14px;
        flex-wrap: wrap;
    }
    
    .additional-options a {
        color: #1a2a6c;
        text-decoration: none;
        transition: color 0.3s;
        margin-bottom: 10px;
        text-align: center;
        flex: 1;
        min-width: 120px;
    }
    
    .additional-options a:hover {
        color: #b21f1f;
        text-decoration: underline;
    }
    
    .secure-notice {
        text-align: center;
        margin-top: 30px;
        font-size: 14px;
        color: #28a745;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .secure-notice i {
        margin-right: 8px;
    }
    
    /* Enhanced Responsive Design */
    @media (max-width: 992px) {
        .container {
            flex-direction: column;
            height: auto;
            width: 90%;
            max-width: 600px;
        }
        
        .left-panel, .right-panel {
            padding: 35px 30px;
            width: 100%;
        }
        
        .left-panel {
            order: 2;
            border-radius: 0 0 20px 20px;
        }
        
        .right-panel {
            order: 1;
            border-radius: 20px 20px 0 0;
        }
        
        .security-features {
            max-width: 100%;
        }
        
        .security-features div {
            justify-content: flex-start;
            margin-left: 10%;
        }
        
        .left-panel p {
            max-width: 80%;
        }
    }
    
    @media (max-width: 768px) {
        .container {
            width: 95%;
            max-width: 500px;
        }
        
        .left-panel, .right-panel {
            padding: 30px 25px;
        }
        
        .left-panel h2 {
            font-size: 26px;
        }
        
        .right-panel h2 {
            font-size: 26px;
        }
        
        .security-features div {
            margin-left: 5%;
        }
    }
    
    @media (max-width: 576px) {
        .container {
            width: 100%;
            border-radius: 15px;
        }
        
        .left-panel, .right-panel {
            padding: 25px 20px;
        }
        
        .left-panel h2 {
            font-size: 24px;
        }
        
        .right-panel h2 {
            font-size: 24px;
            margin-bottom: 25px;
        }
        
        .bank-logo {
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
        }
        
        .bank-logo i {
            font-size: 50px;
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        .input-group input {
            padding: 12px 15px;
            font-size: 15px;
        }
        
        .input-group i {
            top: 40px;
        }
        
        .btn-login {
            padding: 14px;
            font-size: 16px;
        }
        
        .additional-options {
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        
        .additional-options a {
            min-width: 100%;
            padding: 8px 0;
        }
        
        .security-features div {
            margin-left: 0;
            justify-content: center;
        }
        
        .left-panel p {
            max-width: 100%;
        }
    }
    
    @media (max-width: 400px) {
        .left-panel, .right-panel {
            padding: 20px 15px;
        }
        
        .left-panel h2 {
            font-size: 22px;
        }
        
        .right-panel h2 {
            font-size: 22px;
        }
        
        .bank-logo {
            width: 90px;
            height: 90px;
        }
        
        .bank-logo i {
            font-size: 45px;
        }
        
        .input-group input {
            padding: 10px 12px;
            font-size: 14px;
        }
        
        .input-group i {
            top: 38px;
            right: 12px;
        }
        
        .btn-login {
            padding: 12px;
            font-size: 15px;
        }
        
        .security-features div {
            font-size: 13px;
        }
    }
    
    /* Orientation-specific adjustments */
    @media (max-height: 700px) and (min-width: 993px) {
        .container {
            min-height: 500px;
        }
        
        .left-panel, .right-panel {
            padding: 30px 25px;
        }
        
        .bank-logo {
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
        }
        
        .bank-logo i {
            font-size: 50px;
        }
        
        .left-panel h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        
        .right-panel h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
    }
    
    @media (max-height: 600px) {
        body {
            align-items: flex-start;
            padding-top: 30px;
            padding-bottom: 30px;
        }
    }
    
    /* Print styles */
    @media print {
        body {
            background: white !important;
            animation: none;
        }
        
        .container {
            box-shadow: none;
            background: white;
        }
        
        .left-panel {
            background: #1a2a6c !important;
            -webkit-print-color-adjust: exact;
            color-adjust: exact;
        }
        
        .btn-login {
            background: #1a2a6c !important;
            -webkit-print-color-adjust: exact;
            color-adjust: exact;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="left-panel">
            <div class="bank-logo">
                <i class="fas fa-landmark"></i>
            </div>
            <h2>Secure Online ATM Access</h2>
            <p>Experience the next generation of digital banking with our secure online ATM services</p>
            
            <div class="security-features">
                <div><i class="fas fa-lock"></i> 256-bit SSL Encryption</div>
                <div><i class="fas fa-shield-alt"></i> Multi-Factor Authentication</div>
                <div><i class="fas fa-fingerprint"></i> Biometric Verification</div>
                <div><i class="fas fa-bell"></i> Real-time Fraud Monitoring</div>
            </div>
        </div>
        
        <div class="right-panel">
            <h2>Login to Your Account</h2>
            <form action="#" method="POST">
                <div class="input-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter your card number"  title="Please enter a valid 16-19 digit card number">
                    <i class="fas fa-credit-card"></i>
                </div>
                
                <div class="input-group">
                    <label for="pin">PIN</label>
                    <input type="password" id="pin" name="pin" placeholder="Enter your PIN" required pattern="[0-9]{4,6}" title="PIN must be 4-6 digits">
                    <i class="fas fa-lock password-toggle" onclick="togglePassword()"></i>
                </div>
                
                <div class="input-group">
                    <label for="securityCode">Security Code (CVV)</label>
                    <input type="text" id="securityCode" name="securityCode" placeholder="Enter CVV" required pattern="[0-9]{3,4}" title="CVV must be 3 or 4 digits">
                    <i class="fas fa-shield-alt"></i>
                </div>
                
                <button onclick="goHome()" type="submit" class="btn-login">Access Account</button>
            </form>
            
            <div class="additional-options">
                <a href="forgatPin.jsp"><i class="fas fa-key"></i> Forgot PIN?</a>
                <a href="#"><i class="fas fa-credit-card"></i> Lost Card?</a>
                <a href="Register.jsp"><i class="fas fa-user-plus"></i> Register</a>
            </div>
            
            <div class="secure-notice">
                <i class="fas fa-lock"></i> Your information is securely encrypted
            </div>
        </div>
    </div>

    <script>
    		function goHome(){
    			window.location.href = "home.jsp";
    		}
    
        function togglePassword() {
            const pinInput = document.getElementById('pin');
            const icon = document.querySelector('.password-toggle');
            
            if (pinInput.type === 'password') {
                pinInput.type = 'text';
                icon.classList.remove('fa-lock');
                icon.classList.add('fa-unlock');
            } else {
                pinInput.type = 'password';
                icon.classList.remove('fa-unlock');
                icon.classList.add('fa-lock');
            }
        }
        
        // Format card number input with spaces
        document.getElementById('cardNumber').addEventListener('input', function(e) {
            const input = e.target.value.replace(/\D/g, '').substring(0, 19);
            let formattedInput = '';
            
            for (let i = 0; i < input.length; i++) {
                if (i > 0 && i % 4 === 0) formattedInput += ' ';
                formattedInput += input[i];
            }
            
            e.target.value = formattedInput;
        });
        
        // Enhance form submission for mobile devices
        document.querySelector('form').addEventListener('submit', function(e) {
            // Additional validation could be added here if needed
            const cardNumber = document.getElementById('cardNumber').value.replace(/\s/g, '');
            document.getElementById('cardNumber').value = cardNumber;
        });
    </script>
</body>
</html>