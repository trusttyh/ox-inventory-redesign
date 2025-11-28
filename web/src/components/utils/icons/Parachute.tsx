export const Parachute: React.FC = () => {
  return (
    <svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
        d="M6 28 C12 10, 52 10, 58 28 Q32 18, 6 28 Z"
        stroke="#707070"
        strokeWidth={3}
        fill="none"
        strokeLinecap="round"
        strokeLinejoin="round"
      />

      <path
        d="M6 28 Q18 14, 32 14 Q46 14, 58 28"
        stroke="#707070"
        strokeWidth={2}
        strokeLinecap="round"
        strokeLinejoin="round"
        opacity="0.7"
      />

      <path d="M14 28 L26 44" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />
      <path d="M32 28 L32 44" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />
      <path d="M50 28 L38 44" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />

      <rect x="25" y="44" width="14" height="10" rx="3" stroke="#707070" strokeWidth={2.5} fill="none" />
      <path d="M29 49 H35" stroke="#707070" strokeWidth={2.5} strokeLinecap="round" />
    </svg>
  );
};

export default Parachute;
