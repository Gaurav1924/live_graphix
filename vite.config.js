import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import path from 'path';

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'assets/js'),
      '@components': path.resolve(__dirname, 'assets/vue_components'),
    },
  },
  server: {
    port: 3000,
  },
  build: {
    outDir: 'priv/static/assets',
    emptyOutDir: true,
    rollupOptions: {
      input: 'assets/js/main.ts',
    },
  },
});
