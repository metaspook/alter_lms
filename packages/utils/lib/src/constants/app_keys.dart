abstract final class AppKeys {
  static const cipherKey = 'cipherKey';
  static const dashboard = 'dashboard';
  static const installationId = 'installationId';
  static const read = 'read';
  static const amount = 'amount';
  static const settings = 'settings';
  static const packageId = 'packageId';
  static const purchaseType = 'purchaseType';
  static const sourceRouteName = 'sourceRouteName';
  static const document = 'document';
  // data cache path keys
  static const cached = 'cached';
  static const cachedProducts = '$cached/products';
  static const cachedStockProducts = '$cached/stock/products';
  static const cachedSales = '$cached/sales';
  static const cachedPurchases = '$cached/purchases';
  static const cachedTokenDetails = '$cached/tokenDetails';
  static const cachedParties = '$cached/parties';
  static const cachedUser = '$cached/user';
  static const cachesAll = <String>[
    ...cachesData,
    cachedUser,
    cachedTokenDetails,
  ];
  static const cachesData = <String>[
    cachedProducts,
    cachedStockProducts,
    cachedSales,
    cachedPurchases,
    cachedParties,
  ];
  // for navigation
  static const redirectFrom = 'redirect_from';
  static const type = 'type';
  static const id = 'id';
  static const entry = 'entry';
  static const fromParty = 'from_party';
  static const ref = 'ref';
  static const startDate = 'start_date';
  static const endDate = 'end_date';
  static const permission = 'permission';

  static const partyPayment = 'party_payment';
  static const paymentReceive = 'payment_receive';
  static const paymentReceived = 'payment_received';

  static const ownerCashIn = 'owner_cash_in';
  static const ownerCashOut = 'owner_cash_out';
  static const customerList = 'customer_list';
  static const supplierList = 'supplier_list';
  static const stock = 'stock';
  static const lowStockList = 'low_stock_list';
  static const expiringItems = 'expiring_items';
  static const expiredItems = 'expired_items';
  static const logout = 'logout';
  static const reports = 'reports';
  static const salesReports = 'sales_report';

  static const package = 'package';
  static const packageFeature = 'package_feature';

  // permission related
  static const sales = 'sales';
  static const salesReturn = 'sales_return';
  static const purchase = 'purchase';
  static const purchaseReturn = 'purchase_return';
  static const otherExpense = 'other_expense';
  static const productBrand = 'product_brand';
  static const productName = 'product_name';
  static const businessManagement = 'business_management';
  static const others = 'others';
  static const itemStockReports = 'item_stock_reports';
  static const expenseReports = 'expense_reports';
  static const transactionReports = 'transaction_reports';
  static const partyReports = 'party_reports';

  // setting related
  static const notification = 'notification';
  static const appLanguage = 'app_language';
  static const dateFormat = 'date_format';
  static const quickOpen = 'quick_open';
  static const keepScreenLightOn = 'keep_screen_light_on';
  static const usePinCode = 'use_pin_code';
  static const changePinCode = 'change_pin_code';
  static const openingBalance = 'opening_balance';
  static const allowInvoicePreview = 'allow_invoice_preview';
  static const sendSMS = 'send_sms';
  static const note = 'note';
  static const productImage = 'product_image';
  static const overInvoicing = 'over_invoice';
  static const manageStock = 'manage_stock';
  static const batchWiseStock = 'batch_wise_stock';
  static const List<String> thermalSettings = [
    // global
    thermalPaperSize,
    showQRCode,
    showPaymentMode,
    thermalPaperSize,
    printerDevices,
    // local
    invoiceAutoCut,
    autoDrawerOpen,
  ];
  // - invoice Settings global
  static const shopName = 'shop_name';
  static const shopLogo = 'shop_logo';
  static const showTitle = 'show_title';
  static const showSignature = 'show_signature';
  static const showDate = 'show_date';
  static const showCompanyAddress = 'show_shop_address';
  static const showTermsConditions = 'show_terms_conditions';
  static const showQRCode = 'show_QR_code';
  static const showPaymentMode = 'show_payment_mode';
  static const thermalPaperSize = 'thermal_paper_size';
  static const printerDevices = 'printer_devices';
  // - invoice Settings local
  static const regularPrinter = 'regular_printer';
  static const thermalPrinter = 'thermal_printer';
  static const invoiceAutoCut = 'invoice_auto_cut';
  static const autoDrawerOpen = 'auto_drawer_open';
  //
  static const fromInitialRoute = 'from_initial_route';
  static const fromDashboard = 'from_dashboard';
  static const fromCustomer = 'from_customer';
  static const fromSupplier = 'from_supplier';
  static const fromSignUp = 'from_sign_up';
  static const fromSignIn = 'from_sign_in';
  static const fromStock = 'from_stock';
  static const fromLowStock = 'from_low_stock';
  static const fromExpiringProducts = 'from_expiring_products';
  static const fromExpiredProducts = 'from_expired_products';
  static const fromAddNewBusinessUser = 'from_add_new_business_user';
  static const fromDeleteBusiness = 'from_delete_business';
  static const fromBusinessList = 'from_business_list';
  static const fromSubscriptions = 'from_subscriptions';
  static const fromPurchaseSms = 'from_purchase_sms';

  // useful in route to dynamic pages
  static const asOwnerCashIn = 'as_owner_cash_in';
  static const asOwnerCashOut = 'as_owner_cash_out';
  static const asTotalOwnerCashIn = 'as_total_owner_cash_in';
  static const asTotalOwnerCashOut = 'as_total_owner_cash_out';

  //
  static const purchaseId = 'purchaseId';
  static const saleId = 'saleId';
  static const partyId = 'partyId';
  static const productId = 'productId';
  static const billNo = 'billNo';
  static const invoiceNo = 'invoiceNo';
  static const category = 'category';
  static const product = 'product';
  static const parentCategory = 'parentCategory';
  static const cash = 'cash';
  static const primaryUnit = 'primaryUnit';

  static const serialNumber = 'serial_number';

  // shared preference
  static const settingsPrefsKey = 'settingsPrefs';
}
