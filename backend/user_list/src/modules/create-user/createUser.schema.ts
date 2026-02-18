import { z } from 'zod';

export const createUserSchema = z.object({
  name: z
    .string()
    .min(1)
    .refine(
      (value) => value.trim().split(/\s+/).filter(Boolean).length >= 2,
      { message: 'Ilia.user.invalid_name_format' },
    ),
  email: z.email({ message: 'Ilia.user.invalid_email_format' }),
});

export type CreateUserInput = z.infer<typeof createUserSchema>;
