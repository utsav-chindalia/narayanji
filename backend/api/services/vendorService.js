const supabase = require('../config/supabaseClient');

// Service for vendor-related business logic, e.g., checking if a vendor phone is allowed

/**
 * Checks if a vendor with the given phone exists in the database.
 * @param {string} phone - The phone number to check.
 * @returns {Promise<boolean>} - True if allowed, false otherwise.
 */
async function isVendorAllowed(phone) {
  const { data, error } = await supabase
    .from('vendors')
    .select('id')
    .eq('phone', phone)
    .maybeSingle();
  if (error) {
    throw error;
  }
  return !!data;
}

module.exports = { isVendorAllowed }; 