const supabase = require('../config/supabaseClient');

/**
 * Middleware to authenticate requests using JWT via Supabase.
 */
module.exports = async function authMiddleware(req, res, next) {
  const authHeader = req.headers['authorization'];
  console.log(authHeader);
  console.log(req.headers);
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({ error: 'Missing or invalid Authorization header' });
  }

  const token = authHeader.split(' ')[1];
  try {
    // Validate JWT with Supabase
    const { data, error } = await supabase.auth.getUser(token);
    if (error || !data || !data.user) {
      return res.status(401).json({ error: 'Invalid or expired token' });
    }
    req.user = data.user;
    next();
  } catch (err) {
    return res.status(401).json({ error: 'Authentication failed' });
  }
}; 