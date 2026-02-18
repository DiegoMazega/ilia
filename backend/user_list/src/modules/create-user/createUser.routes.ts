import { Router } from 'express';
import { routeRateLimiter } from '../../shared/rateLimiter.js';
import { createUserController } from './createUser.controller.js';

const router = Router();

router.post('/create-user', routeRateLimiter, createUserController);

export default router;
