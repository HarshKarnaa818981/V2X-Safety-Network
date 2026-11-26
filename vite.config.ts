import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
export default defineConfig({plugins:[react()],base:'./',server:{allowedHosts:['terminal.local'],proxy:{'/api/fsu':{target:'http://192.168.4.1',changeOrigin:true,rewrite:p=>p.replace(/^\/api\/fsu/,'')}}},build:{chunkSizeWarningLimit:900}});
