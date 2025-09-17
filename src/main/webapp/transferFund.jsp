<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delicious Bank - Transfer Funds</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            overflow-x: hidden;
        }

        .bank-container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Animated Background */
        .animated-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .circle {
            position: absolute;
            border-radius: 50%;
            opacity: 0.1;
            animation: float 15s infinite linear;
        }

        .circle-1 {
            width: 300px;
            height: 300px;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            top: -150px;
            left: -150px;
            animation-delay: 0s;
        }

        .circle-2 {
            width: 200px;
            height: 200px;
            background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
            bottom: -100px;
            right: -100px;
            animation-delay: -5s;
        }

        .circle-3 {
            width: 150px;
            height: 150px;
            background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
            top: 50%;
            left: 80%;
            animation-delay: -10s;
        }

        .circle-4 {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #00d2ff 0%, #3a7bd5 100%);
            bottom: 30%;
            left: 10%;
            animation-delay: -7s;
        }

        @keyframes float {
            0% {
                transform: translate(0, 0) rotate(0deg);
            }
            50% {
                transform: translate(20px, 20px) rotate(180deg);
            }
            100% {
                transform: translate(0, 0) rotate(360deg);
            }
        }

        /* Header Styles */
        .bank-header {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo i {
            font-size: 2rem;
        }

        .logo h1 {
            font-weight: 700;
            font-size: 1.8rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.5);
        }

        /* Main Content */
        .main-content {
            display: flex;
            flex: 1;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #fff;
            padding: 1.5rem 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
        }

        .nav-item {
            padding: 1rem 1.5rem;
            display: flex;
            align-items: center;
            gap: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #555;
            position: relative;
            overflow: hidden;
        }

        .nav-item:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(37, 117, 252, 0.1), transparent);
            transition: all 0.5s ease;
        }

        .nav-item:hover:before {
            left: 100%;
        }

        .nav-item:hover {
            background-color: #f0f5ff;
            color: #2575fc;
        }

        .nav-item.active {
            background-color: #f0f5ff;
            color: #2575fc;
            border-left: 4px solid #2575fc;
        }

        .nav-item.logout {
            margin-top: auto;
            color: #ff4757;
        }

        .nav-item.logout:hover {
            background-color: #fff5f5;
        }

        /* Content Area */
        .content-area {
            flex: 1;
            padding: 2rem;
            overflow-y: auto;
        }

        .page-header {
            margin-bottom: 2rem;
            animation: fadeIn 0.8s ease;
        }

        .page-header h2 {
            font-size: 1.8rem;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 0.5rem;
        }

        .page-header p {
            color: #7f8c8d;
        }

        /* Transfer Container */
        .transfer-container {
            display: flex;
            flex-direction: column;
            gap: 2rem;
            animation: slideUp 0.8s ease;
        }

        /* Transfer Steps */
        .transfer-steps {
            display: flex;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 2rem;
            position: relative;
        }

        .step:not(:last-child):after {
            content: '';
            position: absolute;
            top: 25px;
            right: -50%;
            width: 100%;
            height: 2px;
            background-color: #ddd;
            z-index: 1;
        }

        .step-number {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #f1f2f6;
            color: #7f8c8d;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
        }

        .step.active .step-number {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.3);
        }

        .step-label {
            font-size: 0.9rem;
            color: #7f8c8d;
        }

        .step.active .step-label {
            color: #2575fc;
            font-weight: 500;
        }

        /* Transfer Content */
        .transfer-content {
            display: flex;
            gap: 2rem;
        }

        .transfer-form-container {
            flex: 1;
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            animation: fadeIn 1s ease;
        }

        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #f1f2f6;
        }

        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .section-title {
            font-size: 1.2rem;
            color: #2c3e50;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title:before {
            content: '';
            width: 8px;
            height: 8px;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            border-radius: 50%;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group.floating {
            position: relative;
        }

        .form-group.floating label {
            position: absolute;
            top: 1rem;
            left: 1rem;
            color: #7f8c8d;
            pointer-events: none;
            transition: all 0.3s ease;
            background: white;
            padding: 0 0.5rem;
        }

        .form-group.floating select:focus + label,
        .form-group.floating input:focus + label,
        .form-group.floating select:not([value=""]) + label,
        .form-group.floating input:not(:placeholder-shown) + label {
            top: -0.5rem;
            left: 0.8rem;
            font-size: 0.8rem;
            color: #2575fc;
        }

        .form-group select, 
        .form-group input {
            width: 100%;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }

        .form-group select:focus, 
        .form-group input:focus {
            outline: none;
            border-color: #2575fc;
            box-shadow: 0 0 0 3px rgba(37, 117, 252, 0.2);
        }

        .select-arrow {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #7f8c8d;
            pointer-events: none;
        }

        /* Transfer Direction */
        .transfer-direction {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 1rem 0;
            position: relative;
        }

        .direction-line {
            width: 100%;
            height: 2px;
            background-color: #f1f2f6;
        }

        .direction-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            position: absolute;
            animation: pulse 2s infinite;
        }

        /* Amount Input */
        .amount-container {
            margin-bottom: 1rem;
        }

        .amount-input {
            position: relative;
        }

        .currency-symbol {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            font-weight: 600;
            color: #555;
            font-size: 1.2rem;
        }

        .amount-input input {
            padding-left: 2.5rem;
            font-size: 1.2rem;
            font-weight: 500;
        }

        .quick-amounts {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .quick-amount {
            padding: 0.5rem 1rem;
            background-color: #f1f2f6;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .quick-amount:hover {
            background-color: #2575fc;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(37, 117, 252, 0.2);
        }

        .balance-info {
            font-size: 0.9rem;
            color: #7f8c8d;
        }

        .balance-amount {
            font-weight: 600;
            color: #2c3e50;
        }

        /* External Fields */
        .external-fields {
            background-color: #f9fafc;
            padding: 1.5rem;
            border-radius: 8px;
            border-left: 4px solid #2575fc;
            margin-top: 1rem;
            display: none;
            animation: slideDown 0.5s ease;
        }

        .custom-date-container {
            display: none;
            animation: slideDown 0.5s ease;
        }

        /* Form Actions */
        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            margin-top: 2rem;
        }

        .btn-cancel, .btn-submit {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-cancel {
            background-color: #f1f2f6;
            color: #747d8c;
        }

        .btn-cancel:hover {
            background-color: #e2e3e9;
            transform: translateY(-2px);
        }

        .btn-submit {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.3);
        }

        .btn-submit:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 117, 252, 0.4);
        }

        /* Transfer Summary */
        .transfer-summary {
            width: 300px;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .summary-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            animation: slideInRight 1s ease;
        }

        .summary-card h3 {
            margin-bottom: 1.5rem;
            color: #2c3e50;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid #eee;
        }

        .summary-content {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
        }

        .summary-item .label {
            color: #7f8c8d;
        }

        .summary-item .value {
            font-weight: 600;
        }

        .summary-item.fee .value {
            color: #e74c3c;
        }

        .summary-divider {
            height: 1px;
            background-color: #eee;
            margin: 0.5rem 0;
        }

        .summary-item.total {
            margin-top: 0.5rem;
        }

        .summary-item.total .value {
            color: #2575fc;
            font-size: 1.2rem;
        }

        .security-notice {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.8rem;
            color: #7f8c8d;
            padding: 0.8rem;
            background-color: #f9fafc;
            border-radius: 8px;
        }

        .security-notice i {
            color: #2575fc;
        }

        /* Recent Transfers */
        .recent-transfers {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            animation: slideInRight 1.2s ease;
        }

        .recent-transfers h4 {
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        .transfer-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem 0;
            border-bottom: 1px solid #f1f2f6;
            animation: fadeIn 1s ease;
        }

        .transfer-item:last-child {
            border-bottom: none;
        }

        .transfer-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f0f5ff;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2575fc;
        }

        .transfer-icon.external {
            background-color: #fff5f5;
            color: #ff4757;
        }

        .transfer-details {
            flex: 1;
        }

        .transfer-amount {
            font-weight: 600;
            color: #2c3e50;
        }

        .transfer-desc {
            font-size: 0.9rem;
            color: #7f8c8d;
        }

        .transfer-date {
            font-size: 0.8rem;
            color: #aaa;
        }

        /* Modal */
        .modal-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .modal-container.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background: white;
            border-radius: 15px;
            width: 90%;
            max-width: 500px;
            overflow: hidden;
            transform: translateY(20px);
            transition: all 0.3s ease;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .modal-container.active .modal-content {
            transform: translateY(0);
        }

        .modal-header {
            padding: 1.5rem;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            font-weight: 600;
        }

        .modal-close {
            background: none;
            border: none;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
        }

        .modal-body {
            padding: 1.5rem;
        }

        .confirmation-details {
            margin-bottom: 2rem;
        }

        .confirmation-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .confirmation-item .label {
            color: #7f8c8d;
        }

        .confirmation-item .value {
            font-weight: 600;
        }

        .modal-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
        }

        .btn-confirm {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.3);
        }

        .btn-confirm:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 117, 252, 0.4);
        }

        /* Success Animation */
        .success-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1001;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .success-animation.active {
            opacity: 1;
            visibility: visible;
        }

        .animation-content {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            max-width: 400px;
            transform: scale(0.9);
            transition: all 0.3s ease;
        }

        .success-animation.active .animation-content {
            transform: scale(1);
        }

        .checkmark {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
        }

        .checkmark__circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: #2575fc;
            fill: none;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }

        .checkmark__check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
        }

        .animation-content h3 {
            font-size: 1.5rem;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .animation-content p {
            color: #7f8c8d;
            margin-bottom: 1.5rem;
        }

        .btn-done {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.3);
        }

        .btn-done:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 117, 252, 0.4);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes slideDown {
            from { transform: translateY(-10px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes slideInRight {
            from { transform: translateX(20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes stroke {
            100% { stroke-dashoffset: 0; }
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .transfer-content {
                flex-direction: column;
            }
            
            .transfer-summary {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                flex-direction: row;
                overflow-x: auto;
                padding: 0.5rem;
            }
            
            .nav-item {
                flex-direction: column;
                padding: 0.5rem;
                font-size: 0.8rem;
                min-width: 80px;
            }
            
            .nav-item span {
                text-align: center;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .quick-amounts {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <div class="bank-container">
        <!-- Animated Background Elements -->
        <div class="animated-bg">
            <div class="circle circle-1"></div>
            <div class="circle circle-2"></div>
            <div class="circle circle-3"></div>
            <div class="circle circle-4"></div>
        </div>

        <!-- Header -->
        <header class="bank-header">
            <div class="header-content">
                <div class="logo">
                    <i class="fas fa-piggy-bank"></i>
                    <h1>Delicious Bank</h1>
                </div>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=User+Name&background=random" alt="User" class="user-avatar">
                    <span>User Name</span>
                </div>
            </div>
        </header>

        <div class="main-content">
            <!-- Sidebar Navigation -->
            <aside class="sidebar">
                <div class="nav-item" onclick="changeView('dashboard')">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
                </div>
                <div class="nav-item" onclick="changeView('accounts')">
                    <i class="fas fa-wallet"></i>
                    <span>Accounts</span>
                </div>
                <div class="nav-item active" onclick="changeView('transfer')">
                    <i class="fas fa-money-bill-transfer"></i>
                    <span>Transfer Funds</span>
                </div>
                <div class="nav-item" onclick="changeView('transactions')">
                    <i class="fas fa-receipt"></i>
                    <span>Transactions</span>
                </div>
                <div class="nav-item" onclick="changeView('payments')">
                    <i class="fas fa-credit-card"></i>
                    <span>Pay Bills</span>
                </div>
                <div class="nav-item" onclick="changeView('settings')">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </div>
                <div class="nav-item logout" onclick="changeView('logout')">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Log Out</span>
                </div>
            </aside>

            <!-- Main Content Area -->
            <main class="content-area">
                <div class="page-header">
                    <h2><i class="fas fa-money-bill-transfer"></i> Transfer Funds</h2>
                    <p>Move money between your accounts or send to others</p>
                </div>

                <div class="transfer-container">
                    <!-- Transfer Steps Indicator -->
                    <div class="transfer-steps">
                        <div class="step active">
                            <div class="step-number">1</div>
                            <div class="step-label">Details</div>
                        </div>
                        <div class="step">
                            <div class="step-number">2</div>
                            <div class="step-label">Review</div>
                        </div>
                        <div class="step">
                            <div class="step-number">3</div>
                            <div class="step-label">Confirm</div>
                        </div>
                    </div>

                    <div class="transfer-content">
                        <div class="transfer-form-container">
                            <form id="transferForm" class="transfer-form" method="post" action="processTransfer">
                                <div class="form-section">
                                    <h3 class="section-title">Transfer Details</h3>
                                    
                                    <div class="form-group floating">
                                        <select id="fromAccount" name="fromAccount" required>
                                            <option value=""></option>
                                            <option value="checking">Delicious Checking •• 7854 ($8,542.36)</option>
                                            <option value="savings">Delicious Savings •• 9218 ($12,107.83)</option>
                                            <option value="premium">Delicious Premium •• 3365 ($25,250.90)</option>
                                        </select>
                                        <label for="fromAccount">From Account</label>
                                        <div class="select-arrow">
                                            <i class="fas fa-chevron-down"></i>
                                        </div>
                                    </div>

                                    <div class="transfer-direction">
                                        <div class="direction-line"></div>
                                        <div class="direction-icon">
                                            <i class="fas fa-arrow-down"></i>
                                        </div>
                                    </div>

                                    <div class="form-group floating">
                                        <select id="toAccount" name="toAccount" required>
                                            <option value=""></option>
                                            <option value="external">External Transfer</option>
                                            <option value="checking">Delicious Checking •• 7854</option>
                                            <option value="savings">Delicious Savings •• 9218</option>
                                            <option value="premium">Delicious Premium •• 3365</option>
                                            <option value="loan">Delicious Auto Loan •• 4521</option>
                                        </select>
                                        <label for="toAccount">To Account</label>
                                        <div class="select-arrow">
                                            <i class="fas fa-chevron-down"></i>
                                        </div>
                                    </div>

                                    <div id="externalAccountFields" class="external-fields">
                                        <div class="form-group floating">
                                            <input type="text" id="routingNumber" name="routingNumber">
                                            <label for="routingNumber">Routing Number</label>
                                        </div>
                                        <div class="form-group floating">
                                            <input type="text" id="accountNumber" name="accountNumber">
                                            <label for="accountNumber">Account Number</label>
                                        </div>
                                        <div class="form-group floating">
                                            <input type="text" id="confirmAccountNumber" name="confirmAccountNumber">
                                            <label for="confirmAccountNumber">Confirm Account Number</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-section">
                                    <h3 class="section-title">Transfer Amount</h3>
                                    
                                    <div class="amount-container">
                                        <div class="form-group floating amount-input">
                                            <span class="currency-symbol">$</span>
                                            <input type="number" id="amount" name="amount" min="0.01" step="0.01" required placeholder=" ">
                                            <label for="amount">Amount</label>
                                        </div>
                                        
                                        <div class="quick-amounts">
                                            <div class="quick-amount" data-amount="25">$25</div>
                                            <div class="quick-amount" data-amount="50">$50</div>
                                            <div class="quick-amount" data-amount="100">$100</div>
                                            <div class="quick-amount" data-amount="500">$500</div>
                                        </div>
                                    </div>

                                    <div class="balance-info">
                                        Available balance: <span class="balance-amount">$8,542.36</span>
                                    </div>
                                </div>

                                <div class="form-section">
                                    <h3 class="section-title">Schedule Transfer</h3>
                                    
                                    <div class="form-group floating">
                                        <select id="date" name="date">
                                            <option value="today">Today</option>
                                            <option value="nextDay">Next Business Day</option>
                                            <option value="date">Select a date</option>
                                        </select>
                                        <label for="date">Transfer Date</label>
                                        <div class="select-arrow">
                                            <i class="fas fa-chevron-down"></i>
                                        </div>
                                    </div>

                                    <div id="customDateContainer" class="custom-date-container">
                                        <div class="form-group floating">
                                            <input type="date" id="customDate" name="customDate">
                                            <label for="customDate">Select Date</label>
                                        </div>
                                    </div>

                                    <div class="form-group floating">
                                        <input type="text" id="memo" name="memo" placeholder=" ">
                                        <label for="memo">Memo (Optional)</label>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button type="button" class="btn-cancel" onclick="changeView('dashboard')">
                                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                                    </button>
                                    <button type="submit" class="btn-submit">
                                        Continue <i class="fas fa-arrow-right"></i>
                                    </button>
                                </div>
                            </form>
                        </div>

                        <div class="transfer-summary">
                            <div class="summary-card">
                                <h3>Transfer Summary</h3>
                                <div class="summary-content">
                                    <div class="summary-item">
                                        <span class="label">From:</span>
                                        <span class="value">Not selected</span>
                                    </div>
                                    <div class="summary-item">
                                        <span class="label">To:</span>
                                        <span class="value">Not selected</span>
                                    </div>
                                    <div class="summary-item">
                                        <span class="label">Amount:</span>
                                        <span class="value">$0.00</span>
                                    </div>
                                    <div class="summary-item">
                                        <span class="label">Date:</span>
                                        <span class="value">Today</span>
                                    </div>
                                    <div class="summary-item fee">
                                        <span class="label">Fee:</span>
                                        <span class="value">$0.00</span>
                                    </div>
                                    <div class="summary-divider"></div>
                                    <div class="summary-item total">
                                        <span class="label">Total:</span>
                                        <span class="value">$0.00</span>
                                    </div>
                                </div>

                                <div class="security-notice">
                                    <i class="fas fa-shield-alt"></i>
                                    <span>Your transactions are secured with 256-bit encryption</span>
                                </div>
                            </div>

                            <div class="recent-transfers">
                                <h4>Recent Transfers</h4>
                                <div class="transfer-item">
                                                                    <div class="transfer-icon">
                                    <i class="fas fa-exchange-alt"></i>
                                </div>
                                <div class="transfer-details">
                                    <div class="transfer-amount">$250.00</div>
                                    <div class="transfer-desc">To Savings •• 9218</div>
                                    <div class="transfer-date">Aug 12, 2023</div>
                                </div>
                            </div>
                            <div class="transfer-item">
                                <div class="transfer-icon external">
                                    <i class="fas fa-external-link-alt"></i>
                                </div>
                                <div class="transfer-details">
                                    <div class="transfer-amount">$150.00</div>
                                    <div class="transfer-desc">To John Smith</div>
                                    <div class="transfer-date">Aug 5, 2023</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Confirmation Modal -->
<div class="modal-container" id="confirmationModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Confirm Transfer</h3>
            <button class="modal-close" onclick="closeModal()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body">
            <div class="confirmation-details">
                <div class="confirmation-item">
                    <span class="label">From Account:</span>
                    <span class="value" id="confirmFrom">-</span>
                </div>
                <div class="confirmation-item">
                    <span class="label">To Account:</span>
                    <span class="value" id="confirmTo">-</span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Amount:</span>
                    <span class="value" id="confirmAmount">-</span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Date:</span>
                    <span class="value" id="confirmDate">-</span>
                </div>
            </div>
            <div class="modal-actions">
                <button class="btn-cancel" onclick="closeModal()">Cancel</button>
                <button class="btn-confirm" onclick="processTransfer()">Confirm Transfer</button>
            </div>
        </div>
    </div>
</div>

<!-- Success Animation -->
<div class="success-animation" id="successAnimation">
    <div class="animation-content">
        <div class="checkmark">
            <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/>
                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
            </svg>
        </div>
        <h3>Transfer Successful!</h3>
        <p>Your funds transfer has been processed successfully</p>
        <button class="btn-done" onclick="hideSuccessAnimation()">Done</button>
    </div>
</div>

<script>
    // Handle external account fields visibility
    document.addEventListener('DOMContentLoaded', function() {
        const toAccountSelect = document.getElementById('toAccount');
        const externalAccountFields = document.getElementById('externalAccountFields');
        const dateSelect = document.getElementById('date');
        const customDateContainer = document.getElementById('customDateContainer');
        
        // External account fields
        toAccountSelect.addEventListener('change', function() {
            if (this.value === 'external') {
                externalAccountFields.style.display = 'block';
            } else {
                externalAccountFields.style.display = 'none';
            }
            updateSummary();
        });
        
        // Custom date selection
        dateSelect.addEventListener('change', function() {
            if (this.value === 'date') {
                customDateContainer.style.display = 'block';
            } else {
                customDateContainer.style.display = 'none';
            }
            updateSummary();
        });
        
        // Update summary when form changes
        const form = document.getElementById('transferForm');
        const summaryFrom = document.querySelector('.summary-content .summary-item:nth-child(1) .value');
        const summaryTo = document.querySelector('.summary-content .summary-item:nth-child(2) .value');
        const summaryAmount = document.querySelector('.summary-content .summary-item:nth-child(3) .value');
        const summaryDate = document.querySelector('.summary-content .summary-item:nth-child(4) .value');
        const summaryTotal = document.querySelector('.summary-content .summary-item.total .value');
        
        form.addEventListener('change', updateSummary);
        form.addEventListener('input', updateSummary);
        
        // Quick amount buttons
        document.querySelectorAll('.quick-amount').forEach(button => {
            button.addEventListener('click', function() {
                const amount = this.getAttribute('data-amount');
                document.getElementById('amount').value = amount;
                updateSummary();
                
                // Add visual feedback
                this.classList.add('active');
                setTimeout(() => {
                    this.classList.remove('active');
                }, 300);
            });
        });
        
        // Form submission
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            showConfirmationModal();
        });
        
        // Initialize floating labels
        initFloatingLabels();
    });
    
    function updateSummary() {
        // Update from account
        const fromAccount = document.getElementById('fromAccount');
        if (fromAccount.value) {
            const selectedOption = fromAccount.options[fromAccount.selectedIndex];
            const text = selectedOption.text.split(' (')[0];
            document.querySelector('.summary-content .summary-item:nth-child(1) .value').textContent = text;
        } else {
            document.querySelector('.summary-content .summary-item:nth-child(1) .value').textContent = 'Not selected';
        }
        
        // Update to account
        const toAccount = document.getElementById('toAccount');
        if (toAccount.value) {
            if (toAccount.value === 'external') {
                document.querySelector('.summary-content .summary-item:nth-child(2) .value').textContent = 'External Account';
            } else {
                const selectedOption = toAccount.options[toAccount.selectedIndex];
                document.querySelector('.summary-content .summary-item:nth-child(2) .value').textContent = selectedOption.text;
            }
        } else {
            document.querySelector('.summary-content .summary-item:nth-child(2) .value').textContent = 'Not selected';
        }
        
        // Update amount
        const amount = document.getElementById('amount').value;
        if (amount) {
            const amountValue = '$' + parseFloat(amount).toFixed(2);
            document.querySelector('.summary-content .summary-item:nth-child(3) .value').textContent = amountValue;
            document.querySelector('.summary-content .summary-item.total .value').textContent = amountValue;
        } else {
            document.querySelector('.summary-content .summary-item:nth-child(3) .value').textContent = '$0.00';
            document.querySelector('.summary-content .summary-item.total .value').textContent = '$0.00';
        }
        
        // Update date
        const date = document.getElementById('date');
        if (date.value) {
            const selectedOption = date.options[date.selectedIndex];
            let dateText = selectedOption.text;
            
            if (date.value === 'date') {
                const customDate = document.getElementById('customDate').value;
                if (customDate) {
                    dateText = new Date(customDate).toLocaleDateString();
                }
            }
            
            document.querySelector('.summary-content .summary-item:nth-child(4) .value').textContent = dateText;
        }
    }
    
    function initFloatingLabels() {
        const floatingInputs = document.querySelectorAll('.form-group.floating input, .form-group.floating select');
        
        floatingInputs.forEach(input => {
            // Check if input has value on page load
            if (input.value) {
                input.parentElement.classList.add('focused');
            }
            
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
        });
    }
    
    function showConfirmationModal() {
        // Populate confirmation details
        document.getElementById('confirmFrom').textContent = document.querySelector('.summary-content .summary-item:nth-child(1) .value').textContent;
        document.getElementById('confirmTo').textContent = document.querySelector('.summary-content .summary-item:nth-child(2) .value').textContent;
        document.getElementById('confirmAmount').textContent = document.querySelector('.summary-content .summary-item:nth-child(3) .value').textContent;
        document.getElementById('confirmDate').textContent = document.querySelector('.summary-content .summary-item:nth-child(4) .value').textContent;
        
        // Show modal
        document.getElementById('confirmationModal').classList.add('active');
    }
    
    function closeModal() {
        document.getElementById('confirmationModal').classList.remove('active');
    }
    
    function processTransfer() {
        // Simulate transfer processing
        closeModal();
        
        // Show success animation after a short delay
        setTimeout(() => {
            document.getElementById('successAnimation').classList.add('active');
        }, 500);
    }
    
    function hideSuccessAnimation() {
        document.getElementById('successAnimation').classList.remove('active');
        
        // Reset form
        document.getElementById('transferForm').reset();
        document.querySelectorAll('.form-group.floating').forEach(group => {
            group.classList.remove('focused');
        });
        updateSummary();
    }
    
    function changeView(view) {
        console.log("Changing to view: " + view);
        // In a real application, this would navigate to different pages
        // For this example, we'll just log the action
        if (view === 'logout') {
            alert('Logging out...');
        }
    }
</script>