export const toAsciiLower = (value: string): string => {
  let result = '';

  for (let i = 0; i < value.length; i++) {
    const code = value.charCodeAt(i);

    if (code >= 65 && code <= 90) {
      result += String.fromCharCode(code + 32);
    } else {
      result += value[i];
    }
  }

  return result;
};
