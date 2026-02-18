import { Router } from 'express';
import { routeRateLimiter } from '../../shared/rateLimiter.js';
import { getUsersController } from './users.controller.js';

const router = Router();

router.get('/users', routeRateLimiter, getUsersController);

export default router;
