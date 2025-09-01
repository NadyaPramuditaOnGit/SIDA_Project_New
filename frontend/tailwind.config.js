/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      // Mobile First Font Sizes (≤767px)
      fontSize: {
        'xs-mobile': ['0.625rem', { lineHeight: '1rem' }],      // 10px
        'sm-mobile': ['0.75rem', { lineHeight: '1.125rem' }],   // 12px
        'base-mobile': ['0.875rem', { lineHeight: '1.25rem' }], // 14px
        'lg-mobile': ['1rem', { lineHeight: '1.5rem' }],        // 16px
        'xl-mobile': ['1.125rem', { lineHeight: '1.75rem' }],   // 18px
        '2xl-mobile': ['1.25rem', { lineHeight: '1.75rem' }],   // 20px
        '3xl-mobile': ['1.5rem', { lineHeight: '2rem' }],       // 24px
        '4xl-mobile': ['1.875rem', { lineHeight: '2.25rem' }],  // 30px
        '5xl-mobile': ['2.25rem', { lineHeight: '2.5rem' }],    // 36px
        '6xl-mobile': ['3rem', { lineHeight: '1' }],            // 48px
        
        // Tablet/Desktop Font Sizes (≥768px)
        'xs': ['0.75rem', { lineHeight: '1rem' }],              // 12px
        'sm': ['0.875rem', { lineHeight: '1.25rem' }],          // 14px
        'base': ['1rem', { lineHeight: '1.5rem' }],             // 16px
        'lg': ['1.125rem', { lineHeight: '1.75rem' }],          // 18px
        'xl': ['1.25rem', { lineHeight: '1.75rem' }],           // 20px
        '2xl': ['1.5rem', { lineHeight: '2rem' }],              // 24px
        '3xl': ['1.875rem', { lineHeight: '2.25rem' }],         // 30px
        '4xl': ['2.25rem', { lineHeight: '2.5rem' }],           // 36px
        '5xl': ['3rem', { lineHeight: '1' }],                   // 48px
        '6xl': ['3.5rem', { lineHeight: '1' }],                 // 56px
      },
      
      // Custom Screen Breakpoints
      screens: {
        'mobile': {'max': '767px'},
        'tablet': {'min': '768px', 'max': '1023px'},
        'laptop': {'min': '1024px', 'max': '1279px'},
        'desktop': {'min': '1280px', 'max': '1535px'},
        'wide': {'min': '1536px'},
      },
      
      // Extended Colors
      colors: {
        primary: {
          50: '#eff6ff',
          100: '#dbeafe',
          200: '#bfdbfe',
          300: '#93c5fd',
          400: '#60a5fa',
          500: '#3b82f6',
          600: '#2563eb',
          700: '#1d4ed8',
          800: '#1e40af',
          900: '#1e3a8a',
        },
        success: {
          50: '#f0fdf4',
          100: '#dcfce7',
          200: '#bbf7d0',
          300: '#86efac',
          400: '#4ade80',
          500: '#22c55e',
          600: '#16a34a',
          700: '#15803d',
          800: '#166534',
          900: '#14532d',
        },
        warning: {
          50: '#fffbeb',
          100: '#fef3c7',
          200: '#fde68a',
          300: '#fcd34d',
          400: '#fbbf24',
          500: '#f59e0b',
          600: '#d97706',
          700: '#b45309',
          800: '#92400e',
          900: '#78350f',
        },
        error: {
          50: '#fef2f2',
          100: '#fee2e2',
          200: '#fecaca',
          300: '#fca5a5',
          400: '#f87171',
          500: '#ef4444',
          600: '#dc2626',
          700: '#b91c1c',
          800: '#991b1b',
          900: '#7f1d1d',
        },
      },
      
      // Custom Animations
      animation: {
        'fade-in': 'fadeIn 0.5s ease-out',
        'slide-up': 'slideUp 0.3s ease-out',
        'slide-down': 'slideDown 0.3s ease-out',
        'slide-in-right': 'slideInRight 0.3s ease-out',
        'slide-in-left': 'slideInLeft 0.3s ease-out',
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'bounce-slow': 'bounce 2s infinite',
        'spin-slow': 'spin 3s linear infinite',
      },
      
      // Custom Keyframes
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(10px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        slideUp: {
          '0%': { transform: 'translateY(100%)' },
          '100%': { transform: 'translateY(0)' },
        },
        slideDown: {
          '0%': { transform: 'translateY(-100%)' },
          '100%': { transform: 'translateY(0)' },
        },
        slideInRight: {
          '0%': { transform: 'translateX(100%)' },
          '100%': { transform: 'translateX(0)' },
        },
        slideInLeft: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(0)' },
        },
        pulse: {
          '0%, 100%': { opacity: '1' },
          '50%': { opacity: '0.7' },
        },
      },
      
      // Custom Spacing
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
        '128': '32rem',
      },
      
      // Custom Border Radius
      borderRadius: {
        '4xl': '2rem',
      },
      
      // Custom Box Shadow
      boxShadow: {
        'soft': '0 2px 15px -3px rgba(0, 0, 0, 0.07), 0 10px 20px -2px rgba(0, 0, 0, 0.04)',
        'medium': '0 4px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 20px -5px rgba(0, 0, 0, 0.04)',
        'large': '0 10px 40px -10px rgba(0, 0, 0, 0.15), 0 10px 30px -15px rgba(0, 0, 0, 0.05)',
      },
    },
  },
  plugins: [],
  // Dark mode configuration
  darkMode: 'class',
}