export const getBaseUrl = () => {
    return "/api";
};
export const URLS = {
    // admin
    ADMIN_CUSTOMERS: () => `${getBaseUrl()}/admin/user-manager`,
    ADMIN_CUSTOMERS_CREATE: () => `${getBaseUrl()}/admin/user-created`,
    ADMIN_CUSTOMERS_UPDATE: (id) => `${getBaseUrl()}/admin/user-updated/${id}`,
    ADMIN_CUSTOMERS_DELETE: (id) => `${getBaseUrl()}/admin/user-deleted/${id}`,
    ADMIN_CATEGORIES_SHOW: () => `${getBaseUrl()}/admin/category-manager`,
    ADMIN_CATEGORIES_CREATE: () => `${getBaseUrl()}/admin/category-created`,
    ADMIN_CATEGORIES_UPDATE: (id) => `${getBaseUrl()}/admin/category-updated/${id}`,
    ADMIN_CATEGORIES_DELETE: (id) => `${getBaseUrl()}/admin/category-deleted/${id}`,
    ADMIN_SHOPS_GET: () => `${getBaseUrl()}/admin/shops`,
    ADMIN_PRODUCTS_GET: () => `${getBaseUrl()}/admin/products`,
    ADMIN_PRODUCTS_CREATED: () => `${getBaseUrl()}/admin/product-created`,
    ADMIN_AUCTIONS_SHOW: () => `${getBaseUrl()}/admin/auctions`,
    ADMIN_AUCTIONS_CREATED: () => `${getBaseUrl()}/admin/auction-created`,
    // front
    ADMIN_LOGIN: () => `${getBaseUrl()}/admin/login`,
    AMIN_LOGOUT: () => `${getBaseUrl()}/admin/logout`,
    // customer
    CUSTOMER_LOGIN: () => `${getBaseUrl()}/customer/login`,
    CUSTOMER_REGISTER: () => `${getBaseUrl()}/customer/register`,
    CUSTOMER_PRODUCT_AUCTION: () => `${getBaseUrl()}/customer/product-auction-customer`,
    CUSTOMER_PRODUCT_AUCTION_EXPIRED: (id) => `${getBaseUrl()}/customer/product-auction-customer-expired/${id}`,
    CUSTOMER_PRODUCT_DETAIL: (id) => `${getBaseUrl()}/customer/product-detail/${id}`,
    CUSTOMER_PRODUCT_DETAIL_BIDDING: (id) => `${getBaseUrl()}/customer/product-detail/bids/${id}`,
    CUSTOMER_PRODUCT_LIST_BIDDING: (id) => `${getBaseUrl()}/customer/product-detail/bids/${id}`,
    CUSTOMER_PRODUCT_WINNER: () => `${getBaseUrl()}/customer/product-detail/win-bidding`

}
