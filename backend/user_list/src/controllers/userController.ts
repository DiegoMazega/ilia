import type { Request, Response } from 'express';

interface User {
  id: number;
  name: string;
  email: string;
}

// Mock data
const users: User[] = [
  { id: 1, name: 'Diego', email: 'diego@example.com' },
  { id: 2, name: 'Ilia', email: 'ilia@example.com' },
];

export const getAllUsers = (req: Request, res: Response) => {
  res.status(200).json(users);
};

export const createUser = (req: Request, res: Response) => {
  const { name, email } = req.body;
  
  if (!name || !email) {
    return res.status(400).json({ message: 'Name and email are required' });
  }

  const newUser: User = {
    id: users.length + 1,
    name,
    email,
  };
  
  users.push(newUser);
  res.status(201).json(newUser);
};
