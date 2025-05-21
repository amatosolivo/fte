import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': resolve(__dirname, './src'),
    },
  },
  define: {
    'process.env.RQID': JSON.stringify(process.env.RQID || 'local-dev'),
    'process.env.BUILD_NUMBER': JSON.stringify(process.env.BUILD_NUMBER || '0'),
  },
  build: {
    outDir: 'dist',
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          nextjs: ['next']
        }
      }
    }
  }
})