<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SecureBank Online ATM</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>
        :root {
            --primary: #1a237e;
            --primary-light: #534bae;
            --primary-dark: #000051;
            --secondary: #f5f5f5;
            --text-primary: #212121;
            --text-secondary: #757575;
            --success: #4caf50;
            --warning: #ff9800;
            --danger: #f44336;
            --card-bg: #ffffff;
            --main-bg: #f5f7fa;
            --border-color: #e0e0e0;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --hover-effect: brightness(0.95);
        }

        .dark-mode {
            --primary: #3949ab;
            --primary-light: #6f74dd;
            --primary-dark: #00227b;
            --secondary: #121212;
            --text-primary: #f5f5f5;
            --text-secondary: #b3b3b3;
            --card-bg: #1e1e1e;
            --main-bg: #121212;
            --border-color: #424242;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition: background-color 0.3s, color 0.3s;
        }

        body {
            background-color: var(--main-bg);
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .atm-container {
            width: 100%;
            max-width: 1200px;
            background-color: var(--card-bg);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--shadow);
            display: flex;
            flex-direction: column;
            height: 95vh;
        }

        .atm-header {
            background-color: var(--primary);
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--border-color);
            position: relative;
        }

        .bank-logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .bank-logo i {
            font-size: 2.2rem;
        }

        .bank-name {
            font-size: 1.8rem;
            font-weight: 700;
        }

        .user-info {
            text-align: right;
        }

        .welcome-text {
            font-size: 1.2rem;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .account-number {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        .atm-body {
            display: flex;
            flex: 1;
            overflow: hidden;
        }

        .sidebar {
            width: 260px;
            background-color: var(--card-bg);
            border-right: 1px solid var(--border-color);
            padding: 25px 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s ease;
            overflow-y: auto;
            height: 100%;
        }

        .nav-section {
            padding: 0 15px;
        }

        .nav-title {
            font-size: 0.9rem;
            text-transform: uppercase;
            color: var(--text-secondary);
            margin-bottom: 15px;
            padding: 0 15px;
            font-weight: 600;
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 14px 20px;
            border-radius: 10px;
            margin-bottom: 8px;
            cursor: pointer;
            color: var(--text-primary);
            text-decoration: none;
            font-weight: 500;
        }

        .nav-item i {
            margin-right: 15px;
            font-size: 1.2rem;
            width: 24px;
            text-align: center;
        }

        .nav-item:hover, .nav-item.active {
            background-color: var(--primary-light);
            color: white;
        }

        .main-content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
            background-color: var(--main-bg);
            height: 100%;
        }

        .dashboard-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            font-weight: 600;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .balance-card {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border-radius: 16px;
            padding: 25px;
            color: white;
            margin-bottom: 25px;
            box-shadow: var(--shadow);
        }

        .balance-label {
            font-size: 1rem;
            margin-bottom: 10px;
            opacity: 0.9;
        }

        .balance-amount {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .account-details {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 0.9rem;
            opacity: 0.9;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .action-card {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            box-shadow: var(--shadow);
            border: 1px solid var(--border-color);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .action-icon {
            font-size: 2.2rem;
            margin-bottom: 15px;
            color: var(--primary);
        }

        .action-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--text-primary);
        }

        .action-desc {
            font-size: 0.9rem;
            color: var(--text-secondary);
        }

        .transactions-section {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 20px;
            box-shadow: var(--shadow);
            border: 1px solid var(--border-color);
        }

        .transaction-list {
            list-style: none;
        }

        .transaction-item {
            display: flex;
            justify-content: space-between;
            padding: 16px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .transaction-item:last-child {
            border-bottom: none;
        }

        .transaction-details {
            flex: 1;
        }

        .transaction-title {
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--text-primary);
        }

        .transaction-date {
            font-size: 0.85rem;
            color: var(--text-secondary);
        }

        .transaction-amount {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .transaction-amount.withdrawal {
            color: var(--danger);
        }

        .transaction-amount.deposit {
            color: var(--success);
        }

        .atm-footer {
            background-color: var(--card-bg);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid var(--border-color);
        }

        .footer-info {
            display: flex;
            gap: 20px;
        }

        .footer-link {
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .footer-link:hover {
            color: var(--primary);
        }

        .logout-btn {
            background-color: transparent;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 8px 16px;
            color: var(--text-primary);
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .logout-btn:hover {
            background-color: var(--hover-effect);
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: var(--card-bg);
            border-radius: 16px;
            width: 90%;
            max-width: 500px;
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        .modal-header {
            padding: 20px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 1.4rem;
            font-weight: 600;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--text-secondary);
        }

        .modal-body {
            padding: 20px;
            max-height: 60vh;
            overflow-y: auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-primary);
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid var(--border-color);
            background-color: var(--main-bg);
            color: var(--text-primary);
            font-size: 1rem;
        }

        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid var(--border-color);
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .modal-btn {
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-secondary {
            background-color: transparent;
            border: 1px solid var(--border-color);
            color: var(--text-primary);
        }

        .settings-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .settings-option:last-child {
            border-bottom: none;
        }

        .option-info {
            flex: 1;
        }

        .option-title {
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--text-primary);
        }

        .option-desc {
            font-size: 0.9rem;
            color: var(--text-secondary);
        }

        .theme-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 30px;
        }

        .theme-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 22px;
            width: 22px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: var(--primary);
        }

        input:checked + .slider:before {
            transform: translateX(30px);
        }

        /* Mobile Toggle Button */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            position: absolute;
            right: 20px;
            top: 25px;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 998;
        }

        @media (max-width: 992px) {
            .atm-container {
                height: 100vh;
                border-radius: 0;
            }
            
            body {
                padding: 0;
            }
            
            .menu-toggle {
                display: block;
            }
            
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                z-index: 999;
                transform: translateX(-100%);
                width: 280px;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .overlay.active {
                display: block;
            }
            
            .main-content {
                padding: 20px;
            }
            
            .balance-amount {
                font-size: 2.2rem;
            }
            
            .quick-actions {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                gap: 15px;
            }
            
            .action-icon {
                font-size: 1.8rem;
            }
            
            .action-title {
                font-size: 1rem;
            }
            
            .footer-info {
                flex-direction: column;
                gap: 10px;
            }
            
            .atm-footer {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }
            
            .logout-btn {
                align-self: flex-end;
            }
        }

        @media (max-width: 576px) {
            .atm-header {
                padding: 15px 20px;
            }
            
            .bank-name {
                font-size: 1.5rem;
            }
            
            .welcome-text {
                font-size: 1rem;
            }
            
            .account-number {
                font-size: 0.8rem;
            }
            
            .section-title {
                font-size: 1.3rem;
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .balance-card {
                padding: 20px;
            }
            
            .balance-amount {
                font-size: 1.8rem;
            }
            
            .account-details {
                flex-direction: column;
                gap: 5px;
            }
            
            .quick-actions {
                grid-template-columns: 1fr 1fr;
            }
            
            .action-card {
                padding: 15px;
            }
            
            .transactions-section {
                padding: 15px;
            }
            
            .transaction-item {
                flex-direction: column;
                gap: 10px;
            }
            
            .transaction-amount {
                align-self: flex-end;
            }
        }
    </style>
</head>
<body>
    <div class="atm-container">
        <div class="atm-header">
            <div class="bank-logo">
                <i class="fas fa-university"></i>
                <div class="bank-name">SecureBank</div>
            </div>
            <div class="user-info">
                <div class="welcome-text">Welcome, John Doe</div>
                <div class="account-number">Account: XXXX-XXXX-XXXX-1234</div>
            </div>
            <button class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </button>
        </div>
        
        <div class="atm-body">
            <div class="sidebar" id="sidebar">
                <div class="nav-section">
                    <div class="nav-title">Main Menu</div>
                    <div class="nav-item active" onclick="changeView('dashboard')">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </div>
                    <div class="nav-item" onclick="changeView('transactions')">
                        <i class="fas fa-exchange-alt"></i>
                        <span>Transactions</span>
                    </div>
                    <div class="nav-item" onclick="changeView('transfer')">
                        <i class="fas fa-money-bill-transfer"></i>
                        <span>Transfer Funds</span>
                    </div>
                    <div class="nav-item" onclick="changeView('payments')">
                        <i class="fas fa-credit-card"></i>
                        <span>Bill Payments</span>
                    </div>
                    
                    <div class="nav-title">Account</div>
                    <div class="nav-item" onclick="changeView('details')">
                        <i class="fas fa-user-circle"></i>
                        <span>Account Details</span>
                    </div>
                    <div class="nav-item" onclick="showModal('pinModal')">
                        <i class="fas fa-key"></i>
                        <span>Change PIN</span>
                    </div>
                    <div class="nav-item" onclick="changeView('statements')">
                        <i class="fas fa-file-invoice"></i>
                        <span>Account Statements</span>
                    </div>
                    
                    <div class="nav-title">Services</div>
                    <div class="nav-item" onclick="showModal('supportModal')">
                        <i class="fas fa-headset"></i>
                        <span>Customer Support</span>
                    </div>
                    <div class="nav-item" onclick="changeView('settings')">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </div>
                </div>
                
                <div class="nav-section">
                    <div class="nav-item" onclick="confirmLogout()">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </div>
                </div>
            </div>
            
            <div class="main-content">
                <div class="dashboard-section">
                    <div class="section-title">
                        <span>Account Overview</span>
                        <span id="current-date"></span>
                    </div>
                    
                    <div class="balance-card">
                        <div class="balance-label">Available Balance</div>
                        <div class="balance-amount">12,458.50</div>
                        <div class="account-details">
                            <span>Checking Account</span>
                            <span>● ● ● ● 1234</span>
                        </div>
                    </div>
                    
                    <div class="section-title">Quick Actions</div>
                    <div class="quick-actions">
                        <div class="action-card" onclick="showModal('transferModal')">
                            <div class="action-icon">
                                <i class="fas fa-paper-plane"></i>
                            </div>
                            <div class="action-title">Send Money</div>
                            <div class="action-desc">Transfer to another account</div>
                        </div>
                        
                        <div class="action-card" onclick="showModal('withdrawModal')">
                            <div class="action-icon">
                                <i class="fas fa-money-bill-wave"></i>
                            </div>
                            <div class="action-title">Withdraw Cash</div>
                            <div class="action-desc">ATM withdrawal</div>
                        </div>
                        
                        <div class="action-card" onclick="showModal('depositModal')">
                            <div class="action-icon">
                                <i class="fas fa-plus-circle"></i>
                            </div>
                            <div class="action-title">Deposit Funds</div>
                            <div class="action-desc">Add money to account</div>
                        </div>
                        
                        <div class="action-card" onclick="showModal('billModal')">
                            <div class="action-icon">
                                <i class="fas fa-file-invoice-dollar"></i>
                            </div>
                            <div class="action-title">Pay Bills</div>
                            <div class="action-desc">Utility bills & services</div>
                        </div>
                    </div>
                    
                    <div class="section-title">Recent Transactions</div>
                    <div class="transactions-section">
                        <ul class="transaction-list">
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Grocery Store</div>
                                    <div class="transaction-date">Aug 15, 2023 • Debit Card</div>
                                </div>
                                <div class="transaction-amount withdrawal">85.40</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Salary Deposit</div>
                                    <div class="transaction-date">Aug 10, 2023 • Direct Deposit</div>
                                </div>
                                <div class="transaction-amount deposit">- 4,250.00</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Electricity Bill</div>
                                    <div class="transaction-date">Aug 5, 2023 • Online Payment</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 124.30</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Online Transfer</div>
                                    <div class="transaction-date">Aug 2, 2023 • To John Smith</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 200.00</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Mobile Recharge</div>
                                    <div class="transaction-date">Jul 28, 2023 • Phone Credit</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 30.00</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Coffee Shop</div>
                                    <div class="transaction-date">Jul 25, 2023 • Debit Card</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 12.50</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Interest Earned</div>
                                    <div class="transaction-date">Jul 20, 2023 • Savings Interest</div>
                                </div>
                                <div class="transaction-amount deposit">+ 18.75</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Netflix Subscription</div>
                                    <div class="transaction-date">Jul 15, 2023 • Auto Payment</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 15.99</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Gas Station</div>
                                    <div class="transaction-date">Jul 12, 2023 • Debit Card</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 48.30</div>
                            </li>
                            <li class="transaction-item">
                                <div class="transaction-details">
                                    <div class="transaction-title">Online Shopping</div>
                                    <div class="transaction-date">Jul 8, 2023 • Amazon Purchase</div>
                                </div>
                                <div class="transaction-amount withdrawal">- 67.89</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="atm-footer">
            <div class="footer-info">
                <a href="#" class="footer-link" onclick="showModal('supportModal')">
                    <i class="fas fa-phone-alt"></i>
                    <span>24/7 Support: 1-800-123-4567</span>
                </a>
                <a href="#" class="footer-link" onclick="showModal('securityModal')">
                    <i class="fas fa-shield-alt"></i>
                    <span>Security Center</span>
                </a>
            </div>
            <button class="logout-btn" onclick="confirmLogout()">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </button>
        </div>
    </div>

    <!-- Overlay for mobile menu -->
    <div class="overlay" id="overlay"></div>

    <!-- Modals for various functions -->
    <div id="transferModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Transfer Funds</h3>
                <button class="close-btn" onclick="closeModal('transferModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="fromAccount">From Account</label>
                    <select id="fromAccount">
                        <option>Checking Account (XXXX-1234)</option>
                        <option>Savings Account (XXXX-5678)</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="toAccount">To Account</label>
                    <input type="text" id="toAccount" placeholder="Enter account number">
                </div>
                <div class="form-group">
                    <label for="transferAmount">Amount</label>
                    <input type="number" id="transferAmount" placeholder="Enter amount">
                </div>
                <div class="form-group">
                    <label for="transferNotes">Notes (Optional)</label>
                    <input type="text" id="transferNotes" placeholder="Add a note">
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn btn-secondary" onclick="closeModal('transferModal')">Cancel</button>
                <button class="modal-btn btn-primary" onclick="executeTransfer()">Transfer</button>
            </div>
        </div>
    </div>

    <div id="pinModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Change PIN</h3>
                <button class="close-btn" onclick="closeModal('pinModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="currentPin">Current PIN</label>
                    <input type="password" id="currentPin" placeholder="Enter current PIN" maxlength="4">
                </div>
                <div class="form-group">
                    <label for="newPin">New PIN</label>
                    <input type="password" id="newPin" placeholder="Enter new PIN" maxlength="4">
                </div>
                <div class="form-group">
                    <label for="confirmPin">Confirm New PIN</label>
                    <input type="password" id="confirmPin" placeholder="Confirm new PIN" maxlength="4">
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn btn-secondary" onclick="closeModal('pinModal')">Cancel</button>
                <button class="modal-btn btn-primary" onclick="changePin()">Change PIN</button>
            </div>
        </div>
    </div>

    <div id="settingsModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Account Settings</h3>
                <button class="close-btn" onclick="closeModal('settingsModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="settings-option">
                    <div class="option-info">
                        <div class="option-title">Dark Mode</div>
                        <div class="option-desc">Switch between light and dark themes</div>
                    </div>
                    <label class="theme-switch">
                        <input type="checkbox" id="darkModeToggle">
                        <span class="slider"></span>
                    </label>
                </div>
                
                <div class="settings-option">
                    <div class="option-info">
                        <div class="option-title">Language</div>
                        <div class="option-desc">Change interface language</div>
                    </div>
                    <select id="languageSelect">
                        <option>English</option>
                        <option>Spanish</option>
                        <option>French</option>
                        <option>German</option>
                    </select>
                </div>
                
                <div class="settings-option">
                    <div class="option-info">
                        <div class="option-title">Notifications</div>
                        <div class="option-desc">Manage your alert preferences</div>
                    </div>
                    <label class="theme-switch">
                        <input type="checkbox" id="notificationsToggle" checked>
                        <span class="slider"></span>
                    </label>
                </div>
                
                <div class="settings-option">
                    <div class="option-info">
                        <div class="option-title">Transaction Limits</div>
                        <div class="option-desc">Set daily transaction limits</div>
                    </div>
                    <button class="modal-btn btn-secondary">Configure</button>
                </div>
                
                <div class="settings-option">
                    <div class="option-info">
                        <div class="option-title">Biometric Authentication</div>
                        <div class="option-desc">Use fingerprint or face recognition</div>
                    </div>
                    <label class="theme-switch">
                        <input type="checkbox" id="biometricToggle">
                        <span class="slider"></span>
                    </label>
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn btn-primary" onclick="saveSettings()">Save Settings</button>
            </div>
        </div>
    </div>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script>
        // Initialize with current date
        document.getElementById('current-date').textContent = new Date().toLocaleDateString('en-US', { 
            weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
        });
        
        // Mobile menu toggle functionality
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        const overlay = document.getElementById('overlay');
        
        function toggleMenu() {
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
            
            // Change icon based on menu state
            const icon = menuToggle.querySelector('i');
            if (sidebar.classList.contains('active')) {
                icon.classList.remove('fa-bars');
                icon.classList.add('fa-times');
            } else {
                icon.classList.remove('fa-times');
                icon.classList.add('fa-bars');
            }
        }
        
        menuToggle.addEventListener('click', toggleMenu);
        overlay.addEventListener('click', toggleMenu);
        
        // Close menu when clicking on nav items on mobile
        const navItems = document.querySelectorAll('.nav-item');
        navItems.forEach(item => {
            item.addEventListener('click', () => {
                if (window.innerWidth <= 992) {
                    toggleMenu();
                }
            });
        });
        
        // Modal functions
        function showModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }
        
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }
        
        // Close modal when clicking outside of it
        window.onclick = function(event) {
            let modals = document.getElementsByClassName('modal');
            for (let i = 0; i < modals.length; i++) {
                if (event.target == modals[i]) {
                    modals[i].style.display = 'none';
                }
            }
        }
        
        // Transaction functions with SweetAlert
        function executeTransfer() {
            let amount = document.getElementById('transferAmount').value;
            let recipient = document.getElementById('toAccount').value;
            
            if (amount && recipient) {
                // Show loading alert
                Swal.fire({
                    title: 'Processing Transfer',
                    text: 'Please wait while we process your transaction',
                    icon: 'info',
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading()
                    }
                });
                
                // Simulate processing delay
                setTimeout(() => {
                    Swal.fire({
                        title: 'Transfer Successful!',
                        text: `You have successfully transferred $${amount} to account ${recipient}`,
                        icon: 'success',
                        confirmButtonColor: 'var(--primary)',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        closeModal('transferModal');
                    });
                }, 2000);
            } else {
                Swal.fire({
                    title: 'Missing Information',
                    text: 'Please enter all required details',
                    icon: 'warning',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK'
                });
            }
        }
        
        function changePin() {
            let currentPin = document.getElementById('currentPin').value;
            let newPin = document.getElementById('newPin').value;
            let confirmPin = document.getElementById('confirmPin').value;
            
            if (currentPin.length !== 4) {
                Swal.fire({
                    title: 'Invalid PIN',
                    text: 'Current PIN must be 4 digits',
                    icon: 'error',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK'
                });
                return;
            }
            
            if (newPin.length !== 4) {
                Swal.fire({
                    title: 'Invalid PIN',
                    text: 'New PIN must be 4 digits',
                    icon: 'error',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK'
                });
                return;
            }
            
            if (newPin === confirmPin) {
                // Show processing alert
                Swal.fire({
                    title: 'Updating PIN',
                    text: 'Please wait while we update your PIN',
                    icon: 'info',
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading()
                    }
                });
                
                // Simulate processing delay
                setTimeout(() => {
                    Swal.fire({
                        title: 'PIN Updated                    Successfully!',
                        text: 'Your PIN has been changed successfully',
                        icon: 'success',
                        confirmButtonColor: 'var(--primary)',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        closeModal('pinModal');
                    });
                }, 1500);
            } else {
                Swal.fire({
                    title: 'PIN Mismatch',
                    text: 'New PIN and confirmation do not match',
                    icon: 'error',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK'
                });
            }
        }
        
        function confirmLogout() {
            Swal.fire({
                title: 'Logout Confirmation',
                text: 'Are you sure you want to logout?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: 'var(--primary)',
                cancelButtonColor: 'var(--danger)',
                confirmButtonText: 'Yes, Logout',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Show logout processing
                    Swal.fire({
                        title: 'Logging Out',
                        text: 'Please wait while we securely log you out',
                        icon: 'info',
                        showConfirmButton: false,
                        allowOutsideClick: false,
                        didOpen: () => {
                            Swal.showLoading()
                        }
                    });
                    
                    // Simulate logout process and redirect
                    setTimeout(() => {
                        Swal.fire({
                            title: 'Logged Out Successfully',
                            text: 'You have been securely logged out',
                            icon: 'success',
                            confirmButtonColor: 'var(--primary)',
                            confirmButtonText: 'OK'
                        }).then(() => {
                            // Redirect to login page
                            window.location.href = 'login.jsp';
                        });
                    }, 1500);
                }
            });
        }
        
        function changeView(view) {
            if (view === 'settings') {
                showModal('settingsModal');
            } else {
                // Show loading notification for view change
                Swal.fire({
                    title: 'Loading...',
                    text: `Switching to ${view} view`,
                    icon: 'info',
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    timer: 1000,
                    didOpen: () => {
                        Swal.showLoading()
                    }
                });
                
                // In a real application, this would load the appropriate content
                setTimeout(() => {
                    // For demo purposes, just show a success message
                    if (view !== 'dashboard') {
                        Swal.fire({
                            title: 'View Changed',
                            text: `Now viewing:  {view.charAt(0).toUpperCase() + view.slice(1)}`,
                            icon: 'success',
                            confirmButtonColor: 'var(--primary)',
                            confirmButtonText: 'OK',
                            timer: 1500
                        });
                    }
                }, 1000);
            }
        }
        
        function saveSettings() {
            // Show processing alert
            Swal.fire({
                title: 'Saving Settings',
                text: 'Please wait while we save your preferences',
                icon: 'info',
                showConfirmButton: false,
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading()
                }
            });
            
            // Simulate saving delay
            setTimeout(() => {
                Swal.fire({
                    title: 'Settings Saved!',
                    text: 'Your preferences have been successfully updated',
                    icon: 'success',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK'
                }).then(() => {
                    closeModal('settingsModal');
                });
            }, 1500);
        }
        
        // Dark mode toggle functionality
        const darkModeToggle = document.getElementById('darkModeToggle');
        const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
        
        // Check for saved theme preference or use OS preference
        if (localStorage.getItem('theme') === 'dark' || 
            (!localStorage.getItem('theme') && prefersDarkScheme.matches)) {
            document.body.classList.add('dark-mode');
            darkModeToggle.checked = true;
        }
        
        darkModeToggle.addEventListener('change', function() {
            if (this.checked) {
                document.body.classList.add('dark-mode');
                localStorage.setItem('theme', 'dark');
                
                // Show notification
                Swal.fire({
                    title: 'Dark Mode Enabled',
                    text: 'Interface theme changed to dark mode',
                    icon: 'success',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK',
                    timer: 1500
                });
            } else {
                document.body.classList.remove('dark-mode');
                localStorage.setItem('theme', 'light');
                
                // Show notification
                Swal.fire({
                    title: 'Light Mode Enabled',
                    text: 'Interface theme changed to light mode',
                    icon: 'success',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'OK',
                    timer: 1500
                });
            }
        });
        
        // Initialize with some demo data
        document.addEventListener('DOMContentLoaded', function() {
            // Show welcome message
            setTimeout(() => {
                Swal.fire({
                    title: 'Welcome to SecureBank Online!',
                    text: 'Your secure banking experience starts here',
                    icon: 'info',
                    confirmButtonColor: 'var(--primary)',
                    confirmButtonText: 'Get Started',
                    timer: 3000
                });
            }, 1000);
            
            console.log('Online ATM system loaded with SweetAlert2');
        });
    </script>
</body>
</html>
                        