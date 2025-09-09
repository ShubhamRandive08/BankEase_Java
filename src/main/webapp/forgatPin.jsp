<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recover Your PIN - Online ATM</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
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
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        border: 1px solid rgba(255, 255, 255, 0.18);
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
        background: linear-gradient(135deg, rgba(59, 130, 246, 0.4), rgba(30, 64, 175, 0.4));
        border-radius: 50%;
        z-index: 0;
    }
    
    .security-shape-2 {
        position: absolute;
        bottom: -50px;
        left: -50px;
        width: 150px;
        height: 150px;
        background: linear-gradient(135deg, rgba(30, 64, 175, 0.4), rgba(59, 130, 246, 0.4));
        border-radius: 50%;
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
        background: linear-gradient(135deg, rgba(59, 130, 246, 0.8), rgba(30, 64, 175, 0.8));
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 20px;
        box-shadow: 0 10px 20px rgba(59, 130, 246, 0.3);
        animation: pulse 2s infinite;
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
    }
    
    @keyframes pulse {
        0% { transform: scale(1); box-shadow: 0 0 0 0 rgba(59, 130, 246, 0.7); }
        70% { transform: scale(1.02); box-shadow: 0 0 0 15px rgba(59, 130, 246, 0); }
        100% { transform: scale(1); box-shadow: 0 0 0 0 rgba(59, 130, 246, 0); }
    }
    
    .security-icon i {
        font-size: 45px;
        color: white;
    }
    
    h2 {
        color: white;
        font-size: 28px;
        margin-bottom: 10px;
        text-align: center;
        font-weight: 700;
        text-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }
    
    .subtitle {
        text-align: center;
        color: rgba(255, 255, 255, 0.9);
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
        background: rgba(59, 130, 246, 0.7);
        color: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 10px;
        font-weight: 600;
        font-size: 16px;
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .active .step-number {
        background: rgba(16, 185, 129, 0.8);
        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.3);
    }
    
    .step-text {
        font-size: 12px;
        color: rgba(255, 255, 255, 0.8);
        font-weight: 500;
    }
    
    .active .step-text {
        color: #10b981;
        font-weight: 600;
        text-shadow: 0 0 5px rgba(16, 185, 129, 0.5);
    }
    
    .step-connector {
        position: absolute;
        top: 17px;
        left: 60%;
        width: 70%;
        height: 2px;
        background: rgba(255, 255, 255, 0.2);
        z-index: -1;
    }
    
    .form-container {
        position: relative;
        z-index: 1;
    }
    
    .input-group {
        margin-bottom: 25px;
        display: block;
    }
    
    .otp-group {
        display: none;
        margin-bottom: 25px;
    }
    
    .input-group label {
        display: block;
        margin-bottom: 10px;
        font-weight: 600;
        color: white;
        text-align: left;
        font-size: 15px;
        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }
    
    .input-group input, .input-group select {
        width: 100%;
        padding: 16px 20px;
        border: 2px solid rgba(255, 255, 255, 0.2);
        border-radius: 12px;
        font-size: 16px;
        transition: all 0.3s;
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        color: white;
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
    }
    
    .input-group input:focus, .input-group select:focus {
        border-color: rgba(59, 130, 246, 0.8);
        outline: none;
        box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.3);
        background: rgba(255, 255, 255, 0.2);
    }
    
    .input-group input::placeholder {
        color: rgba(255, 255, 255, 0.7);
    }
    
    .input-with-icon {
        position: relative;
    }
    
    .input-with-icon i {
        position: absolute;
        right: 20px;
        top: 18px;
        color: rgba(255, 255, 255, 0.7);
        transition: color 0.3s;
        z-index: 2;
    }
    
    .input-with-icon input:focus + i {
        color: #3b82f6;
    }
    
    .otp-inputs {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-top: 10px;
    }
    
    .otp-input {
        width: 50px;
        height: 60px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        border: 2px solid rgba(255, 255, 255, 0.2);
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s;
        color: white;
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
    }
    
    .otp-input:focus {
        border-color: rgba(59, 130, 246, 0.8);
        outline: none;
        box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.3);
        background: rgba(255, 255, 255, 0.2);
    }
    
    .btn-recover {
        background: linear-gradient(to right, rgba(59, 130, 246, 0.8), rgba(29, 78, 216, 0.8));
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
        box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .btn-recover:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 20px rgba(0, 0, 0, 0.3);
    }
    
    .btn-recover:active {
        transform: translateY(0);
    }
    
    .btn-recover::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to right, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1));
        z-index: -1;
        transform: translateX(-100%);
        transition: transform 0.3s;
    }
    
    .btn-recover:hover::before {
        transform: translateX(0);
    }
    
    .btn-verify-otp {
        background: linear-gradient(to right, rgba(16, 185, 129, 0.8), rgba(5, 150, 105, 0.8));
        display: none;
    }
    
    .login-link {
        text-align: center;
        margin-top: 25px;
        font-size: 16px;
        position: relative;
        z-index: 1;
        color: rgba(255, 255, 255, 0.9);
    }
    
    .login-link a {
        color: #93c5fd;
        text-decoration: none;
        font-weight: 600;
        transition: color 0.3s;
    }
    
    .login-link a:hover {
        color: white;
        text-decoration: underline;
    }
    
    .secure-notice {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #bbf7d0;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        z-index: 1;
        background: rgba(16, 185, 129, 0.2);
        padding: 12px;
        border-radius: 8px;
        border: 1px solid rgba(187, 247, 208, 0.3);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
    }
    
    .secure-notice i {
        margin-right: 8px;
    }
    
    .otp-notice {
        text-align: center;
        margin: 15px 0;
        font-size: 14px;
        color: #93c5fd;
        background: rgba(59, 130, 246, 0.2);
        padding: 12px;
        border-radius: 8px;
        border: 1px solid rgba(147, 197, 253, 0.3);
        display: none;
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
    }
    
    /* Mobile-specific styles */
    @media (max-width: 768px) {
        .container {
            padding: 30px 20px;
            width: 95%;
            border-radius: 16px;
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
        
        .input-group input, .input-group select {
            padding: 14px 16px;
            font-size: 16px;
        }
        
        .btn-recover {
            padding: 16px;
            font-size: 16px;
        }
        
        .recovery-steps {
            flex-direction: column;
            gap: 20px;
        }
        
        .step-connector {
            display: none;
        }
        
        .otp-input {
            width: 45px;
            height: 55px;
            font-size: 20px;
        }
    }
    
    /* Animation for form elements */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .input-group {
        animation: fadeIn 0.5s ease-out forwards;
    }
    
    .input-group:nth-child(1) { animation-delay: 0.2s; }
    .input-group:nth-child(2) { animation-delay: 0.3s; }
    .input-group:nth-child(3) { animation-delay: 0.4s; }
    .btn-recover { animation: fadeIn 0.5s ease-out 0.5s forwards; }
    .login-link { animation: fadeIn 0.5s ease-out 0.6s forwards; }
    .secure-notice { animation: fadeIn 0.5s ease-out 0.7s forwards; }
    
    /* Custom SweetAlert2 styling */
    .swal2-popup {
        background: rgba(255, 255, 255, 0.95) !important;
        backdrop-filter: blur(10px) !important;
        -webkit-backdrop-filter: blur(10px) !important;
        border-radius: 20px !important;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2) !important;
        border: 1px solid rgba(255, 255, 255, 0.18) !important;
    }
    
    .swal2-title {
        color: #1e40af !important;
        font-weight: 700 !important;
    }
    
    .swal2-confirm {
        background: linear-gradient(to right, #3b82f6, #1d4ed8) !important;
        border: none !important;
        border-radius: 12px !important;
        padding: 12px 24px !important;
        font-weight: 600 !important;
        box-shadow: 0 4px 6px rgba(59, 130, 246, 0.3) !important;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="security-shape"></div>
        <div class="security-shape-2"></div>
        
        <div class="header">
            <div class="security-icon">
                <i class="fas fa-key"></i>
            </div>
            <h2>Recover Your PIN</h2>
            <p class="subtitle">Follow these steps to securely recover your ATM PIN</p>
        </div>
        
        <div class="recovery-steps">
            <div class="step active">
                <div class="step-number">1</div>
                <div class="step-text">Verify Identity</div>
            </div>
            <div class="step">
                <div class="step-number">2</div>
                <div class="step-text">Confirm Details</div>
                <div class="step-connector"></div>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <div class="step-text">Reset PIN</div>
            </div>
        </div>
        
        <form action="processPinRecovery.jsp" method="POST" class="form-container" id="recoveryForm">
            <div class="input-group">
                <label for="card_number">Card Number</label>
                <div class="input-with-icon">
                    <input type="text" id="card_number" name="card_number" placeholder="Enter your 16-digit card number" required pattern="[0-9]{16}" title="16-digit card number">
                    <i class="fas fa-credit-card"></i>
                </div>
            </div>
            
            <div class="input-group">
                <label for="account_number">Account Number</label>
                <div class="input-with-icon">
                    <input type="text" id="account_number" name="account_number" placeholder="Enter your account number" required>
                    <i class="fas fa-landmark"></i>
                </div>
            </div>
            
            <div class="input-group">
                <label for="email">Registered Email Address</label>
                <div class="input-with-icon">
                    <input type="email" id="email" name="email" placeholder="Enter your registered email" required>
                    <i class="fas fa-envelope"></i>
                </div>
            </div>
            
            <div class="otp-group" id="otpSection">
                <label for="otp">Enter OTP Sent to Your Email</label>
                <div class="otp-notice" id="otpNotice">
                    <i class="fas fa-info-circle"></i> For demo purposes, use OTP: <strong>123456</strong>
                </div>
                <div class="otp-inputs">
                    <input type="text" class="otp-input" id="otp1" maxlength="1" onkeyup="moveToNext(this, 'otp2')">
                    <input type="text" class="otp-input" id="otp2" maxlength="1" onkeyup="moveToNext(this, 'otp3')">
                    <input type="text" class="otp-input" id="otp3" maxlength="1" onkeyup="moveToNext(this, 'otp4')">
                    <input type="text" class="otp-input" id="otp4" maxlength="1" onkeyup="moveToNext(this, 'otp5')">
                    <input type="text" class="otp-input" id="otp5" maxlength="1" onkeyup="moveToNext(this, 'otp6')">
                    <input type="text" class="otp-input" id="otp6" maxlength="1" onkeyup="moveToNext(this, '')">
                </div>
            </div>
            
            <button type="button" class="btn-recover" id="verifyIdentityBtn">Verify Identity</button>
            <button type="button" class="btn-recover btn-verify-otp" id="verifyOtpBtn">Verify OTP</button>
            
            <div class="login-link">
                Remember your PIN? <a href="login.jsp">Login Here</a>
            </div>
            
            <div class="secure-notice">
                <i class="fas fa-shield-alt"></i> Your information is protected with bank-level security
            </div>
        </form>
    </div>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        // Format card number input with spaces
        document.getElementById('card_number').addEventListener('input', function(e) {
            const input = e.target.value.replace(/\D/g, '').substring(0, 16);
            let formattedInput = '';
            
            for (let i = 0; i < input.length; i++) {
                if (i > 0 && i % 4 === 0) formattedInput += ' ';
                formattedInput += input[i];
            }
            
            e.target.value = formattedInput;
        });
        
        // Handle Verify Identity button click
        document.getElementById('verifyIdentityBtn').addEventListener('click', function() {
            // Basic validation
            const cardNumber = document.getElementById('card_number').value.replace(/\D/g, '');
            const accountNumber = document.getElementById('account_number').value;
            const email = document.getElementById('email').value;
            
            if (cardNumber.length !== 16 || !accountNumber || !email) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    html: '<span style="color:#64748b;">Please fill all fields with valid information</span>',
                    background: 'rgba(255, 255, 255, 0.95)',
                    backdrop: 'rgba(0, 0, 0, 0.4)',
                    confirmButtonColor: '#3b82f6',
                    confirmButtonText: 'Got it!',
                    customClass: {
                        popup: 'sweet-popup'
                    }
                });
                return;
            }
            
            // Show loading notification
            Swal.fire({
                title: 'Verifying Your Information',
                html: '<div style="margin-top:20px;"><i class="fas fa-circle-notch fa-spin" style="font-size:48px;color:#3b82f6"></i></div>',
                background: 'rgba(255, 255, 255, 0.95)',
                backdrop: 'rgba(0, 0, 0, 0.4)',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 2000
            });
            
            // Simulate API call with timeout
            setTimeout(() => {
                // Show OTP section
                document.getElementById('otpSection').style.display = 'block';
                document.getElementById('otpNotice').style.display = 'block';
                document.getElementById('verifyIdentityBtn').style.display = 'none';
                document.getElementById('verifyOtpBtn').style.display = 'block';
                
                // Focus on first OTP input
                document.getElementById('otp1').focus();
                
                // Update steps
                document.querySelectorAll('.step')[0].classList.remove('active');
                document.querySelectorAll('.step')[1].classList.add('active');
                
                // Show success notification
                Swal.fire({
                    icon: 'success',
                    title: 'Verification Successful!',
                    html: '<span style="color:#64748b;">An OTP has been sent to your registered email address</span>',
                    background: 'rgba(255, 255, 255, 0.95)',
                    backdrop: 'rgba(0, 0, 0, 0.4)',
                    confirmButtonColor: '#10b981',
                    confirmButtonText: 'Continue'
                });
            }, 2000);
        });
        
        // Handle Verify OTP button click
        document.getElementById('verifyOtpBtn').addEventListener('click', function() {
            const otp1 = document.getElementById('otp1').value;
            const otp2 = document.getElementById('otp2').value;
            const otp3 = document.getElementById('otp3').value;
            const otp4 = document.getElementById('otp4').value;
            const otp5 = document.getElementById('otp5').value;
            const otp6 = document.getElementById('otp6').value;
            
            const enteredOtp = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
            
            if (enteredOtp.length !== 6) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Incomplete OTP',
                    html: '<span style="color:#64748b;">Please enter the complete 6-digit OTP</span>',
                    background: 'rgba(255, 255, 255, 0.95)',
                    backdrop: 'rgba(0, 0, 0, 0.4)',
                    confirmButtonColor: '#3b82f6',
                    confirmButtonText: 'Okay'
                });
                return;
            }
            
            // Show loading notification
            Swal.fire({
                title: 'Verifying OTP',
                html: '<div style="margin-top:20px;"><i class="fas fa-circle-notch fa-spin" style="font-size:48px;color:#3b82f6"></i></div>',
                background: 'rgba(255, 255, 255, 0.95)',
                backdrop: 'rgba(0, 0, 0, 0.4)',
                showConfirmButton: false,
                allowOutsideClick: false,
                timer: 1500
            });
            
            // Simulate API call with timeout
            setTimeout(() => {
                // For demo purposes, check if OTP is 123456
                if (enteredOtp === '123456') {
                    Swal.fire({
                        icon: 'success',
                        title: 'OTP Verified!',
                        html: '<span style="color:#64748b;">Your identity has been successfully verified</span>',
                        background: 'rgba(255, 255, 255, 0.95)',
                        backdrop: 'rgba(0, 0, 0, 0.4)',
                        confirmButtonColor: '#10b981',
                        confirmButtonText: 'Continue to PIN Reset'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Show final success message before redirect
                            Swal.fire({
                                title: 'Redirecting...',
                                html: '<div style="margin-top:20px;"><i class="fas fa-check-circle" style="font-size:48px;color:#10b981"></i></div><p style="margin-top:20px;color:#64748b;">You will be redirected to PIN reset page</p>',
                                background: 'rgba(255, 255, 255, 0.95)',
                                backdrop: 'rgba(0, 0, 0, 0.4)',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(() => {
                                // Redirect to confirmDetails.jsp
                                window.location.href = 'confirmDetails.jsp';
                            });
                        }
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid OTP',
                        html: '<span style="color:#64748b;">The OTP you entered is invalid. For demo purposes, use OTP: <strong>123456</strong></span>',
                        background: 'rgba(255, 255, 255, 0.95)',
                        backdrop: 'rgba(0, 0, 0, 0.4)',
                        confirmButtonColor: '#3b82f6',
                        confirmButtonText: 'Try Again'
                    });
                }
            }, 1500);
        });
        
        // Function to move to next OTP input
        function moveToNext(current, nextFieldId) {
            if (current.value.length === 1) {
                if (nextFieldId !== '') {
                    document.getElementById(nextFieldId).focus();
                }
            }
        }
        
        // Allow only numbers in OTP fields
        document.querySelectorAll('.otp-input').forEach(input => {
            input.addEventListener('input', function() {
                this.value = this.value.replace(/\D/g, '');
            });
        });
        
        // Add some delicious animations to inputs on focus
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.style.transform = 'scale(1.02)';
                this.style.transition = 'transform 0.3s ease';
            });
            
            input.addEventListener('blur', function() {
                this.style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>