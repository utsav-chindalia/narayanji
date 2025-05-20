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
      .map(field => `${field}.ilike.%${search}%`)
      .join(',');
    query = query.or(orFilters);
  }
  // Apply pagination
  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;
  query = query.range(from, to);
  return query;
}

module.exports = { applySearchAndPagination }; 