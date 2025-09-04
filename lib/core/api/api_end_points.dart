// class ApiEndPoint {
// static const baserUrl = "http://127.0.0.1:8000/admin";
  // static const baserUrl = "http://192.168.118.103:8000/api/";

//   // auth
//   static const login = "$baserUrl/login";
//   static const wallets = "$baserUrl/wallets";
//    static const wallet = "$baserUrl/wallet";
//    static const report = "$baserUrl/report";
// }

class ApiKey {
  // ----------------- عام -----------------
  static const status = "status";
  static const message = "message";
  static const authorization = "authorization";

  // ----------------- Login -----------------
  static const password = "password";

  // ----------------- Wallet Charge -----------------
  static const transactionId = "transaction_id";
  static const chargedBy = "charged_by";
  static const wallet = "wallet";

  // ----------------- Wallet Object -----------------
  static const id = "id";
  static const phoneNumber = "phone_number";
  static const previousBalance = "previous_balance";
  static const newBalance = "new_balance";
  static const owner = "owner";
  static const balance = "balance";
  static const walletNumber = "wallet_number";

  // ----------------- Wallet List / Transactions -----------------
  static const currentPage = "current_page";
  static const data = "data";
  static const firstPageUrl = "first_page_url";
  static const from = "from";
  static const lastPage = "last_page";
  static const lastPageUrl = "last_page_url";
  static const links = "links";
  static const nextPageUrl = "next_page_url";
  static const path = "path";
  static const perPage = "per_page";
  static const prevPageUrl = "prev_page_url";
  static const to = "to";
  static const total = "total";

  // ----------------- Transaction -----------------
  static const walletId = "wallet_id";
  static const userId = "user_id";
  static const type = "type";
  static const amount = "amount";
  static const previousBalanceT = "previous_balance";
  static const newBalanceT = "new_balance";
  static const description = "description";
  static const statusT = "status";
  static const reference = "reference";
  static const createdAt = "created_at";
  static const updatedAt = "updated_at";

  // ----------------- User -----------------
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const email = "email";

  // ----------------- ReportResponse -----------------
  static const reportData = "report_data";

  // ----------------- ReportData -----------------
  static const rideStats = "ride_stats";
  static const financialStats = "financial_stats";
  static const dateRange = "date_range";

  // ----------------- RideStats -----------------
  static const totalRides = "total";
  static const canceled = "canceled";
  static const active = "active";
  static const awaitingConfirmation = "awaiting_confirmation";
  static const completed = "completed";

  // ----------------- FinancialStats -----------------
  static const sycash = "sycash";
  static const adminWallet = "admin_wallet";
  static const activeRidesAmount = "active_rides_amount";
  static const debugInfo = "debug_info";

  // ----------------- SyCash -----------------
  static const currentBalanceSy = "current_balance";
  static const totalRideCreationFees = "total_ride_creation_fees";

  // ----------------- AdminWallet -----------------
  static const currentBalanceAdmin = "current_balance";
  static const totalBookingCollected = "total_booking_collected";
  static const totalBookingTransferred = "total_booking_transferred";

  // ----------------- DebugInfo -----------------
  static const transferCalculationMethods = "transfer_calculation_methods";
  static const adminTransactionTypes = "admin_transaction_types";

  // ----------------- TransferCalculationMethods -----------------
  static const byTransactionType = "by_transaction_type";
  static const byDescription = "by_description";
  static const finalUsed = "final_used";

  // ----------------- AdminTransactionTypes -----------------
  static const adminCredit = "admin_credit";

  // ----------------- AdminCredit -----------------
  static const count = "count";
  static const totalAmount = "total_amount";

  // ----------------- DateRange -----------------
  static const start = "start";
  static const end = "end";
}

class ApiEndPoint {
  static const String baserUrl = 'http://localhost:8000/admin/';
  
  // Admin Authentication endpoints
  static const String login = 'login';
  static const String logout = 'logout';
  static const String getAdminInfo = 'info';
    static const String csrf = 'http://localhost:8000/sanctum/csrf-cookie';
  // Admin Wallet Management
  static const String getAllWallets = '/wallets';
  static const String chargeWallet = 'wallet/charge';
  static const String getWalletTransactions = 'wallet/'; // append wallet_id + '/transactions'
  
  // Admin Dashboard
  static const String dashboard = 'dashboard';
  static const String report = 'report';
  
  // Admin Verification Management
  static const String pendingVerifications = 'verifications/pending';
  static const String approveVerification = 'verifications/'; // append userId + '/approve'
  static const String rejectVerification = 'verifications/'; // append userId + '/reject'
  
  // Debug endpoint
  static const String sessionDebug = 'session-debug';
}