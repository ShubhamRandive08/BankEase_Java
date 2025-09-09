<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Your PIN - Online ATM</title>
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
        background: linear-gradient(135deg, #f59e0b, #d97706);
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
        background: linear-gradient(135deg, #f59e0b, #d97706);
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 20px;
        box-shadow: 0 10px 20px rgba(245, 158, 11, 0.3);
    }
    
    .security-icon i {
        font-size: 45px;
        color: white;
    }
    
    h2 {
        color: #d97706;
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
    
    .completed .step-number {
        background: #10b981;
    }
    
    .active .step-number {
        background: #f59e0b;
        box-shadow: 0 0 0 4px rgba(245, 158, 11, 0.2);
    }
    
    .step-text {
        font-size: 12px;
        color: #64748b;
        font-weight: 500;
    }
    
    .active .step-text {
        color: #f59e0b;
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
    
    .form-container {
        position: relative;
        z-index: 1;
    }
    
    .input-group {
        margin-bottom: 25px;
    }
    
    .input-group label {
        display: block;
        margin-bottom: 10px;
        font-weight: 600;
        color: #1e293b;
        text-align: left;
        font-size: 15px;
    }
    
    .input-group input {
        width: 100%;
        padding: 16px 20px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 16px;
        transition: all 0.3s;
        background: white;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    }
    
    .input-group input:focus {
        border-color: #f59e0b;
        outline: none;
        box-shadow: 0 0 0 4px rgba(245, 158, 11, 0.15);
    }
    
    .input-with-icon {
        position: relative;
    }
    
    .input-with-icon i {
        position: absolute;
        right: 20px;
        top: 18px;
        color: #94a3b8;
        transition: color 0.3s;
        z-index: 2;
        cursor: pointer;
    }
    
    .input-with-icon input:focus + i {
        color: #f59e0b;
    }
    
    .password-rules {
        background: #fffbeb;
        border: 1px solid #fef3c7;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 20px;
        font-size: 14px;
        color: #92400e;
    }
    
    .password-rules ul {
        padding-left: 20px;
        margin: 10px 0 0 0;
    }
    
    .password-rules li {
        margin-bottom: 5px;
    }
    
    .btn-reset {
        background: linear-gradient(to right, #f59e0b, #d97706);
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
        box-shadow: 0 10px 15px rgba(245, 158, 11, 0.2);
    }
    
    .btn-reset:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 20px rgba(245, 158, 11, 0.3);
    }
    
    .success-message {
        text-align: center;
        margin-top: 20px;
        padding: 15px;
        background: #ecfdf5;
        color: #065f46;
        border-radius: 8px;
        border: 1px solid #a7f3d0;
        display: none;
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
    }
</style>
</head>
<body>
    <div class="container">
        <div class="security-shape"></div>
        
        <div class="header">
            <div class="security-icon">
                <i class="fas fa-lock"></i>
            </div>
            <h2>Reset Your PIN</h2>
            <p class="subtitle">Create a new secure PIN for your account</p>
        </div>
        
        <div class="recovery-steps">
            <div class="step completed">
                <div class="step-number"><i class="fas fa-check"></i></div>
                <div class="step-text">Verify Identity</div>
            </div>
            <div class="step completed">
                <div class="step-number"><i class="fas fa-check"></i></div>
                <div class="step-text">Confirm Details</div>
                <div class="step-connector"></div>
            </div>
            <div class="step active">
                <div class="step-number">3</div>
                <div class="step-text">Reset PIN</div>
            </div>
        </div>
        
        <form class="form-container" id="pinResetForm">
            <div class="password-rules">
                <strong>PIN Requirements:</strong>
                <ul>
                    <li>Must be exactly 6 digits</li>
                    <li>Should not be sequential (e.g., 123456)</li>
                    <li>Should not be repetitive (e.g., 111111)</li>
                    <li>Avoid using easily guessable numbers</li>
                </ul>
            </div>
            
            <div class="input-group">
                <label for="new_pin">New PIN</label>
                <div class="input-with-icon">
                    <input type="password" id="new_pin" name="new_pin" placeholder="Enter 6-digit new PIN" required pattern="[0-9]{6}" title="6-digit PIN" maxlength="6">
                    <i class="fas fa-eye password-toggle" onclick="togglePassword('new_pin', this)"></i>
                </div>
            </div>
            
            <div class="input-group">
                <label for="confirm_pin">Confirm New PIN</label>
                <div class="input-with-icon">
                    <input type="password" id="confirm_pin" name="confirm_pin" placeholder="Confirm 6-digit new PIN" required pattern="[0-9]{6}" title="6-digit PIN" maxlength="6">
                    <i class="fas fa-eye password-toggle" onclick="togglePassword('confirm_pin', this)"></i>
                </div>
            </div>
            
            <button type="button" class="btn-reset" onclick="resetPin()">
                Reset PIN
            </button>
            
            <div class="success-message" id="successMessage">
                <i class="fas fa-check-circle"></i> Your PIN has been successfully reset!
            </div>
        </form>
    </div>

    <script>
        function togglePassword(fieldId, icon) {
            const passwordInput = document.getElementById(fieldId);
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
        
        function resetPin() {
            const newPin = document.getElementById('new_pin').value;
            const confirmPin = document.getElementById('confirm_pin').value;
            
            if (newPin.length !== 6) {
                alert('PIN must be exactly 6 digits');
                return;
            }
            
            if (newPin !== confirmPin) {
                alert('PINs do not match');
                return;
            }
            
            // Check for sequential numbers
            if (isSequential(newPin)) {
                alert('Please avoid using sequential numbers for security reasons');
                return;
            }
            
            // Check for repetitive numbers
            if (isRepetitive(newPin)) {
                alert('Please avoid using repetitive numbers for security reasons');
                return;
            }
            
            // Simulate successful PIN reset
            document.getElementById('successMessage').style.display = 'block';
            document.getElementById('pinResetForm').reset();
            
            // Redirect to login after 3 seconds
            setTimeout(function() {
                window.location.href = 'login.jsp';
            }, 3000);
        }
        
        function isSequential(pin) {
            // Check for ascending sequence
            let ascending = true;
            for (let i = 0; i < pin.length - 1; i++) {
                if (parseInt(pin[i]) + 1 !== parseInt(pin[i+1])) {
                    ascending = false;
                    break;
                }
            }
            
            // Check for descending sequence
            let descending = true;
            for (let i = 0; i < pin.length - 1; i++) {
                if (parseInt(pin[i]) - 1 !== parseInt(pin[i+1])) {
                    descending = false;
                    break;
                }
            }
            
            return ascending || descending;
        }
        
        function isRepetitive(pin) {
            const firstChar = pin[0];
            for (let i = 1; i < pin.length; i++) {
                if (pin[i] !== firstChar) {
                    return false;
                }
            }
            return true;
        }
        
        // Validate PIN input to accept only numbers
        document.getElementById('new_pin').addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '');
        });
        
        document.getElementById('confirm_pin').addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '');
        });
    </script>
</body>
</html>