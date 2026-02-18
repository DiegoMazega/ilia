import express, { type Request, type Response } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import createUserRoutes from './modules/create-user/createUser.routes.js';
import usersRoutes from './modules/users/users.routes.js';

const app = express();

const versionApi = '/v1';

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(versionApi, createUserRoutes);
app.use(versionApi, usersRoutes);

app.get('/health', (_req: Request, res: Response) => {
  res.status(200).json({ status: 'OK' });
});

export default app;
