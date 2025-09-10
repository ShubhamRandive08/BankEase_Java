<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deluxe Card Registration - Online ATM</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

:root {
	--primary: #1a2a6c;
	--secondary: #b21f1f;
	--accent: #fdbb2d;
	--light: #f8f9fa;
	--dark: #212529;
	--success: #28a745;
	--danger: #dc3545;
	--warning: #ffc107;
	--info: #17a2b8;
}

body {
	background: linear-gradient(135deg, var(--primary), var(--secondary),
		var(--accent));
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow-x: hidden;
	padding: 20px;
}

@
keyframes gradientBG { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
.container {
	width: 90%;
	max-width: 1000px;
	background: rgba(255, 255, 255, 0.97);
	border-radius: 25px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3), 0 0 0 5px
		rgba(255, 255, 255, 0.1);
	overflow: hidden;
	padding: 40px;
	position: relative;
	z-index: 1;
}

.container::before {
	content: "";
	position: absolute;
	top: -10px;
	left: -10px;
	right: -10px;
	bottom: -10px;
	z-index: -1;
	background: linear-gradient(45deg, var(--primary), var(--secondary),
		var(--accent), var(--primary));
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
	filter: blur(20px);
	opacity: 0.5;
}

.header {
	text-align: center;
	margin-bottom: 40px;
	position: relative;
}

.bank-logo {
	width: 120px;
	height: 120px;
	background: linear-gradient(135deg, var(--primary), var(--secondary));
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto 25px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
	position: relative;
	overflow: hidden;
	transition: transform 0.5s ease;
}

.bank-logo:hover {
	transform: rotate(10deg) scale(1.05);
}

.bank-logo::before {
	content: "";
	position: absolute;
	width: 150%;
	height: 150%;
	background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.2),
		transparent);
	transform: rotate(45deg);
	animation: shine 3s infinite linear;
}

@
keyframes shine { 0% {
	left: -100%;
}

20
%
{
left
:
100%;
}
100
%
{
left
:
100%;
}
}
.bank-logo i {
	font-size: 60px;
	color: white;
	position: relative;
	z-index: 1;
}

h2 {
	color: var(--primary);
	font-size: 36px;
	margin-bottom: 15px;
	text-align: center;
	font-weight: 700;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
	position: relative;
	display: inline-block;
}

h2::after {
	content: "";
	position: absolute;
	bottom: -10px;
	left: 50%;
	transform: translateX(-50%);
	width: 80px;
	height: 4px;
	background: linear-gradient(to right, var(--primary), var(--accent));
	border-radius: 2px;
}

.subtitle {
	text-align: center;
	color: #666;
	margin-bottom: 40px;
	font-size: 18px;
	font-weight: 300;
}

.form-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 25px;
	background: linear-gradient(120deg, rgba(255, 255, 255, 0.95),
		rgba(248, 249, 250, 0.95));
	padding: 40px;
	border-radius: 20px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
	backdrop-filter: blur(10px);
	border: 1px solid rgba(255, 255, 255, 0.6);
	position: relative;
	overflow: hidden;
}

.form-container::before {
	content: "";
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
	background: radial-gradient(circle, rgba(255, 255, 255, 0.2) 0%,
		rgba(255, 255, 255, 0) 60%);
	transform: rotate(30deg);
}

.input-group {
	margin-bottom: 25px;
	position: relative;
	z-index: 1;
}

.input-group.full-width {
	grid-column: 1/-1;
}

.input-group label {
	display: block;
	margin-bottom: 12px;
	font-weight: 600;
	color: var(--primary);
	text-align: left;
	font-size: 16px;
	position: relative;
	padding-left: 10px;
}

.input-group label::before {
	content: "";
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	width: 4px;
	height: 16px;
	background: linear-gradient(to bottom, var(--primary), var(--secondary));
	border-radius: 2px;
}

.input-group input, .input-group select {
	width: 100%;
	padding: 18px 20px;
	border: 2px solid #e9ecef;
	border-radius: 12px;
	font-size: 16px;
	transition: all 0.3s ease;
	background: rgba(255, 255, 255, 0.9);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.input-group input:focus, .input-group select:focus {
	border-color: var(--primary);
	outline: none;
	box-shadow: 0 0 15px rgba(26, 42, 108, 0.2);
	background: rgba(255, 255, 255, 1);
	transform: translateY(-2px);
}

.input-with-icon {
	position: relative;
}

.input-with-icon i {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	color: #777;
	transition: color 0.3s;
	z-index: 2;
	font-size: 18px;
}

.input-with-icon input:focus+i {
	color: var(--primary);
}

.password-toggle {
	cursor: pointer;
}

.btn-register {
	background: linear-gradient(to right, var(--primary), var(--secondary));
	color: white;
	border: none;
	padding: 18px;
	border-radius: 12px;
	font-size: 20px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.4s ease;
	margin-top: 15px;
	width: 100%;
	text-align: center;
	grid-column: 1/-1;
	position: relative;
	overflow: hidden;
	z-index: 1;
	letter-spacing: 1px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn-register::before {
	content: "";
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3),
		transparent);
	transition: 0.5s;
}

.btn-register:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
}

.btn-register:hover::before {
	left: 100%;
}

.btn-register:active {
	transform: translateY(0);
}

.login-link {
	text-align: center;
	margin-top: 30px;
	font-size: 17px;
	grid-column: 1/-1;
	position: relative;
	z-index: 1;
}

.login-link a {
	color: var(--primary);
	text-decoration: none;
	font-weight: 600;
	transition: all 0.3s ease;
	position: relative;
	padding: 5px 0;
}

.login-link a::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 2px;
	background: var(--secondary);
	transition: width 0.3s ease;
}

.login-link a:hover {
	color: var(--secondary);
}

.login-link a:hover::after {
	width: 100%;
}

.secure-notice {
	text-align: center;
	margin-top: 25px;
	font-size: 16px;
	color: var(--success);
	display: flex;
	align-items: center;
	justify-content: center;
	grid-column: 1/-1;
	position: relative;
	z-index: 1;
}

.secure-notice i {
	margin-right: 10px;
	font-size: 20px;
}

/* Floating animation */
@
keyframes float { 0% {
	transform: translateY(0px);
}

50
%
{
transform
:
translateY(
-10px
);
}
100
%
{
transform
:
translateY(
0px
);
}
}
.bank-logo {
	animation: float 4s ease-in-out infinite;
}

/* Animation for form elements */
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.input-group {
	animation: fadeInUp 0.6s ease-out forwards;
}

.input-group:nth-child(1) {
	animation-delay: 0.1s;
}

.input-group:nth-child(2) {
	animation-delay: 0.2s;
}

.input-group:nth-child(3) {
	animation-delay: 0.3s;
}

.input-group:nth-child(4) {
	animation-delay: 0.4s;
}

.input-group:nth-child(5) {
	animation-delay: 0.5s;
}

.input-group:nth-child(6) {
	animation-delay: 0.6s;
}

.input-group:nth-child(7) {
	animation-delay: 0.7s;
}

.btn-register {
	animation: fadeInUp 0.6s ease-out 0.8s forwards;
}

.login-link {
	animation: fadeInUp 0.6s ease-out 0.9s forwards;
}

.secure-notice {
	animation: fadeInUp 0.6s ease-out 1.0s forwards;
}

/* Responsive styles */
@media ( max-width : 768px) {
	.container {
		padding: 25px 20px;
		width: 95%;
		border-radius: 20px;
	}
	.form-container {
		padding: 25px;
		grid-template-columns: 1fr;
	}
	h2 {
		font-size: 28px;
	}
	.bank-logo {
		width: 100px;
		height: 100px;
	}
	.bank-logo i {
		font-size: 45px;
	}
	.input-group input, .input-group select {
		padding: 15px;
	}
	.btn-register {
		padding: 16px;
		font-size: 18px;
	}
}

@media ( max-width : 480px) {
	body {
		padding: 10px;
	}
	.container {
		padding: 20px 15px;
		border-radius: 15px;
	}
	.form-container {
		padding: 20px;
	}
	h2 {
		font-size: 24px;
	}
	.subtitle {
		font-size: 16px;
	}
	.input-group label {
		font-size: 15px;
	}
	.input-group input, .input-group select {
		padding: 14px;
	}
	.btn-register {
		padding: 15px;
		font-size: 16px;
	}
	.login-link {
		font-size: 15px;
	}
}

/* Checkbox styling */
.checkbox-label {
	display: flex;
	align-items: center;
	cursor: pointer;
	font-weight: 500;
	color: var(--dark);
}

.checkbox-label input[type="checkbox"] {
	appearance: none;
	-webkit-appearance: none;
	width: 22px;
	height: 22px;
	border: 2px solid #ced4da;
	border-radius: 5px;
	margin-right: 10px;
	position: relative;
	cursor: pointer;
	transition: all 0.3s ease;
}

.checkbox-label input[type="checkbox"]:checked {
	background: var(--primary);
	border-color: var(--primary);
}

.checkbox-label input[type="checkbox"]:checked::after {
	content: "✓";
	position: absolute;
	color: white;
	font-size: 14px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.checkbox-label a {
	color: var(--primary);
	text-decoration: none;
	font-weight: 600;
	margin: 0 5px;
	transition: all 0.3s ease;
}

.checkbox-label a:hover {
	color: var(--secondary);
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="bank-logo">
				<i class="fas fa-landmark"></i>
			</div>
			<h2>Deluxe Card Registration</h2>
			<p class="subtitle">Register your card for premium online ATM
				access</p>
		</div>

		<form action="register" method="POST" class="form-container"
			id="registrationForm">
			<div class="input-group full-width">
				<label for="account_holder_name">Account Holder Name (As Per
					Bank Passbook)</label> <input type="text" id="account_holder_name"
					name="account_holder_name"
					placeholder="Enter account holder name as per bank records"
					required>
			</div>

			<div class="input-group">
				<label for="account_id">Account Number</label> <input type="number"
					id="account_id" name="account_id"
					placeholder="Enter your account number" required>
			</div>

			<div class="input-group">
				<label for="card_number">Card Number</label>
				<div class="input-with-icon">
					<input type="text" id="card_number" name="card_number"
						placeholder="Enter 16-digit card number"
						title="16-digit card number" required> <i
						class="fas fa-credit-card"></i>
				</div>
			</div>

			<div class="input-group">
				<label for="expiry_date">Expiry Date</label> <input type="date"
					id="expiry_date" name="expiry_date" required>
			</div>

			<div class="input-group">
				<label for="cvv">CVV</label>
				<div class="input-with-icon">
					<input type="text" id="cvv" name="cvv" placeholder="3-digit CVV"
						required pattern="[0-9]{3}" title="3-digit CVV"> <i
						class="fas fa-shield-alt"></i>
				</div>
			</div>

			<div class="input-group">
				<label for="pin">PIN</label>
				<div class="input-with-icon">
					<input type="password" id="pin" name="pin"
						placeholder="6-digit PIN" required pattern="[0-9]{6}"
						title="6-digit PIN"> <i
						class="fas fa-lock password-toggle"
						onclick="togglePassword('pin')"></i>
				</div>
			</div>

			<div class="input-group">
				<label for="confirm_pin">Confirm PIN</label>
				<div class="input-with-icon">
					<input type="password" id="confirm_pin" name="confirm_pin"
						placeholder="Confirm 6-digit PIN" required pattern="[0-9]{6}"
						title="6-digit PIN"> <i
						class="fas fa-lock password-toggle"
						onclick="togglePassword('confirm_pin')"></i>
				</div>
			</div>

			<button type="submit" onclick="validationRegisterPage()"
				class="btn-register">Register Card</button>

			<div class="login-link">
				Already registered? <a href="login.jsp">Login Here</a>
			</div>

			<div class="secure-notice">
				<i class="fas fa-lock"></i> Your information is securely encrypted
				with bank-level security
			</div>
		</form>
	</div>

	<script>
        // SweetAlert notifications
        function showSuccess(message) {
    Swal.fire({
        title: 'Success!',
        text: message,
        icon: 'success',
        confirmButtonColor: '#1a2a6c',
        confirmButtonText: 'Continue',
        background: '#f8f9fa',
        iconColor: '#28a745',
        customClass: {
            title: 'swal-title',
            confirmButton: 'swal-button'
        },
        timer: 5000, // ⏳ Auto close after 5 sec (5000 ms)
        timerProgressBar: true
    }).then((result) => {
        // Redirect after confirm OR after timer auto-close
        if (result.isConfirmed || result.dismiss === Swal.DismissReason.timer) {
            window.location.href = "login.jsp";
        }
    });
}

        
        function showError(message) {
            Swal.fire({
                title: 'Oops...',
                text: message,
                icon: 'error',
                confirmButtonColor: '#b21f1f',
                confirmButtonText: 'Try Again',
                background: '#f8f9fa',
                iconColor: '#dc3545'
            });
        }
        
        function showWarning(message) {
            Swal.fire({
                title: 'Warning!',
                text: message,
                icon: 'warning',
                confirmButtonColor: '#fdbb2d',
                confirmButtonText: 'OK',
                background: '#f8f9fa',
                iconColor: '#ffc107'
            });
        }
        
        // Form validation
        function validationRegisterPage(){
            const acc_holder_name = document.getElementById("account_holder_name").value;
            const acc_no = document.getElementById("account_id").value;
            const card_no = document.getElementById("card_number").value;
            const exp_date = document.getElementById("expiry_date").value;
            const cvv = document.getElementById("cvv").value;
            const pin = document.getElementById("pin").value;
            const con_pin = document.getElementById("confirm_pin").value;
            
            if (acc_holder_name == "" || acc_no == "" || card_no == "" || exp_date == "" || cvv == "" || pin == "" || con_pin == "") {
                showError("Please fill all fields before submitting.");
                // return false;
            } else if (pin !== con_pin) {
                showError("PINs do not match. Please confirm your PIN correctly.");
                return false;
            } else {
                // If all validations pass, show success first
                showSuccess("ATM Registered Successfully. You can Login Now");

                // Wait 5 seconds before submitting
                setTimeout(() => {
                    document.forms[0].submit();  // or use `this.submit()` if inside a form event
                }, 5000);
            }

            
           
        }
    
        function togglePassword(fieldId) {
            const passwordInput = document.getElementById(fieldId);
            const icon = passwordInput.nextElementSibling;
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-lock');
                icon.classList.add('fa-unlock');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-unlock');
                icon.classList.add('fa-lock');
            }
        }
        
        // PIN confirmation validation
        document.getElementById('confirm_pin').addEventListener('input', function() {
            const pin = document.getElementById('pin').value;
            const confirmPin = this.value;
            
            if (pin !== confirmPin) {
                this.setCustomValidity('PINs do not match');
            } else {
                this.setCustomValidity('');
            }
        });
        
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
        
        // Set minimum expiry date to today
        const today = new Date();
        const nextMonth = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        document.getElementById('expiry_date').min = nextMonth.toISOString().split('T')[0];
        
        // Enhance mobile experience
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            document.addEventListener('DOMContentLoaded', function() {
                // Prevent zoom on input focus
                document.querySelectorAll('input, select').forEach(el => {
                    el.addEventListener('focus', function() {
                        window.scrollTo(0, 0);
                        document.body.style.zoom = "100%";
                    });
                });
            });
        }
        
        // Add some interactive effects
        document.querySelectorAll('.input-group input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.parentElement.style.transform = 'translateY(-5px)';
                this.parentElement.parentElement.style.transition = 'transform 0.3s ease';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.parentElement.style.transform = 'translateY(0)';
            });
        });
    </script>
</body>
</html>