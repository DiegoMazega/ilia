export const ErrorKeys = {
  EMAIL_ALREADY_EXISTS: 'Ilia.user.email_already_exists',
  INVALID_NAME_FORMAT: 'Ilia.user.invalid_name_format',
  INVALID_EMAIL_FORMAT: 'Ilia.user.invalid_email_format',
  INVALID_PAYLOAD: 'Ilia.request.invalid_payload',
  FETCH_USERS_ERROR: 'Ilia.user.fetch_users_error',
  INTERNAL_ERROR: 'Ilia.server.internal_error',
  RATE_LIMIT_EXCEEDED: 'Ilia.request.rate_limit_exceeded',
} as const;
