import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
        'gradient-conic':
          'conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))',
      },
      textColor: {
        'robotize': "#441eae"
      },
      borderColor: {
        'robotize': '#441eae'
      },
      backgroundColor: {
        'robotize': '#441eae',
        'robotizeTrans': 'rgba(68,30,174, 0.5)',
        'darkRobotize': '#2d1570'
      },
      gridTemplateColumns: {
        'navbar': '0.20fr auto',
        'navbarEff': '0.012fr auto'
      }
    },
  },
  plugins: [],
}
export default config
