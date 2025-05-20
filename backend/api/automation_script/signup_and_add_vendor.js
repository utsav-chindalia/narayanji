require('dotenv').config({ path: require('path').join(__dirname, '../.env.local') });
const supabase = require('../config/supabaseClient');
const fs = require('fs');
const path = require('path');

// Hardcoded path to vendors.json in this folder
const vendorsFile = path.join(__dirname, 'vendors.json');
const GENERIC_PASSWORD = 'Gajak@123'; // Change as needed

async function main() {
  let vendors;
  try {
    vendors = JSON.parse(fs.readFileSync(vendorsFile, 'utf-8'));
  } catch (err) {
    console.error('Failed to read vendors.json:', err);
    process.exit(1);
  }

  for (const vendor of vendors) {
    try {
      // 1. Create user in Supabase Auth
      const { data: user, error: signupError } = await supabase.auth.admin.createUser({
        email: vendor.phone + '@gajak.com', // Use phone as unique email
        password: GENERIC_PASSWORD,
        phone: vendor.phone,
        email_confirm: true
      });
      if (signupError) throw signupError;
      const userId = user.user.id;
      console.log(`Created user for ${vendor.name}: ${userId}`);

      // 2. Insert into vendors table
      const { error: insertError } = await supabase.from('vendors').insert({
        id: userId,
        name: vendor.name,
        phone: vendor.phone,
        pricing_tier: vendor.pricing_tier
      });
      if (insertError) throw insertError;
      console.log(`Inserted vendor: ${vendor.name}`);
    } catch (err) {
      console.error(`Error processing vendor ${vendor.name}:`, err);
    }
  }
  console.log('Done.');
}

main(); 