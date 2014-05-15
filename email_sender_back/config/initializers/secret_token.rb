# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
EmailSender::Application.config.secret_key_base = '6e18aee98128f0543ce48919b38e4389e5ab6198f5aba0afe8513c1b460b952648b9833affdd6c5caef586a423eb85de28752526df9c1605b365c1dc3b29e88b'
