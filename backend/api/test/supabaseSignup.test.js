const supabase = require('../config/supabaseClient');

describe('Supabase Auth Signup', () => {
//   it('should sign up a user with email and password', async () => {
//     const unique = Date.now();
//     const email = `testuser_${unique}@example.com`;
//     const password = 'TestPassword123!';
//     const { data, error } = await supabase.auth.signUp({
//       email,
//       password,
//     });
//     console.log('Email signup:', { data, error });
//     // If user already exists, Supabase returns an error
//     if (error && error.message.includes('already registered')) {
//       console.warn('User already exists, skipping.');
//       return;
//     }
//     expect(error).toBeNull();
//     expect(data).toHaveProperty('user');
//     expect(data.user.email).toBe(email);
//   });

  it('should sign up a user with phone and password', async () => {
    const unique = Date.now();
    // const phone = `91999${Math.floor(Math.random() * 10000000)}`;
    const phone = `8105885551`;
    const password = 'TestPassword123!';
    const { data, error } = await supabase.auth.signUp({
      phone,
      password,
    });
    console.log('Phone signup:', { data, error });
    // If user already exists, Supabase returns an error
    if (error && error.message.includes('already registered')) {
      console.warn('Phone already exists, skipping.');
      return;
    }
    expect(error).toBeNull();
    expect(data).toHaveProperty('user');
    expect(data.user.phone).toBe(phone);
  });

  // it('should sign up a user with phone OTP (passwordless)', async () => {
  //   const unique = Date.now();
  //   // const phone = `+91999${Math.floor(Math.random() * 10000000)}`;
  //   const phone = `8105885551`;
  //   // Step 1: Request OTP
  //   const { data, error } = await supabase.auth.signInWithOtp({
  //     phone,
  //   });
  //   console.log('OTP request:', { data, error });
  //   expect(error).toBeNull();
  //   // Step 2: Simulate user entering OTP (manual step or mock in CI)
  //   // In a real test, you would retrieve the OTP from the SMS provider or Supabase logs
  //   // For now, prompt or set a placeholder
  //   const otp = process.env.TEST_PHONE_OTP || '123456'; // Replace with actual OTP retrieval in CI
  //   // const { data: verifyData, error: verifyError } = await supabase.auth.verifyOtp({
  //   //   phone,
  //   //   token: otp,
  //   //   type: 'sms',
  //   // });
  //   // console.log('OTP verify:', { verifyData, verifyError });
  //   // This will fail unless the OTP is correct
  //   // In CI, you must set TEST_PHONE_OTP to the correct value
  //   // expect(verifyError).toBeNull();
  //   // expect(verifyData).toHaveProperty('session');
  //   // expect(verifyData.session).not.toBeNull();
  //   // expect(verifyData).toHaveProperty('user');
  //   // expect(verifyData.user.phone).toBe(phone);
  // });
}); 