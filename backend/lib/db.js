import { createAdminClient } from '@insforge/sdk';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
dotenv.config({ path: path.join(__dirname, '../../.env.local') });
dotenv.config({ path: path.join(__dirname, '../.env') });

const baseUrl = process.env.INSFORGE_URL;
const apiKey = process.env.INSFORGE_API_KEY;

if (!baseUrl || !apiKey) {
  console.warn('Warning: INSFORGE_URL and INSFORGE_API_KEY required in .env.local');
}

const db = createAdminClient({ baseUrl, apiKey });

export function from(table) {
  return db.database.from(table);
}

export { db };
