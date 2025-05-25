const supabase = require('../config/supabaseClient');

/**
 * Applies search and pagination to a Supabase query builder.
 * @param {object} query - Supabase query builder
 * @param {object} options
 * @param {string} [options.search] - Search term
 * @param {string[]} [options.searchFields] - Fields to search (ilike)
 * @param {number} [options.page=1] - Page number (1-based)
 * @param {number} [options.pageSize=20] - Items per page
 * @returns {object} - Modified query builder
 */
function applySearchAndPagination(query, { search, searchFields = [], page = 1, pageSize = 20 } = {}) {
  // Apply search
  if (search && searchFields.length > 0) {
    // Use or() to search across multiple fields
    const orFilters = searchFields
      .map(field => `${field}.ilike.${search}%`)
      .join(',');
    query = query.or(orFilters);
  }
  // Apply pagination
  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;
  query = query.range(from, to);
  return query;
}

/**
 * Gets vendor_id and role based on uuid.
 * @param {string} uuid - The uuid to search for (vendor's user id)
 * @returns {Promise<{id: string, role: string|null}|null>} - The vendor id and role if found, or null if not found
 */
async function getVendorIdByUuid(uuid) {
  const { data, error } = await supabase
    .from('vendors')
    .select('id, role')
    .eq('id', uuid)
    .maybeSingle();
  if (error) throw error;
  return data ? { id: data.id, role: data.role } : null;
}

/**
 * Gets vendor details (id, name, phone) based on uuid.
 * @param {string} uuid - The uuid to search for (vendor's user id)
 * @returns {Promise<{id: string, name: string, phone: string, role: string|null}|null>} - The vendor details if found, or null if not found
 */
async function getVendorDetailsById(uuid) {
  const { data, error } = await supabase
    .from('vendors')
    .select('id, name, phone, role')
    .eq('id', uuid)
    .maybeSingle();
  if (error) throw error;
  return data ? data : null;
}

module.exports = { applySearchAndPagination, getVendorIdByUuid, getVendorDetailsById }; 