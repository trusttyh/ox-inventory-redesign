export const BodyArmor: React.FC = () => {
  return (
    <svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
        d="M16 10 H48 C50 20, 54 26, 54 36 V50 C54 54, 50 58, 46 58 H18 C14 58, 10 54, 10 50 V36 C10 26, 14 20, 16 10 Z"
        stroke="#707070"
        strokeWidth={3}
        fill="none"
        strokeLinejoin="round"
      />

      <path d="M16 10 C16 6, 24 6, 24 10" stroke="#707070" strokeWidth={3} strokeLinecap="round" />
      <path d="M48 10 C48 6, 40 6, 40 10" stroke="#707070" strokeWidth={3} strokeLinecap="round" />

      <rect x="20" y="24" width="24" height="10" rx="2" stroke="#707070" strokeWidth={2.5} fill="none" />
      <rect x="20" y="38" width="24" height="10" rx="2" stroke="#707070" strokeWidth={2.5} fill="none" />

      <path d="M10 28 H6 M58 28 H54" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />
      <path d="M10 42 H6 M58 42 H54" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />
    </svg>
  );
};

export default BodyArmor;
