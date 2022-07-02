// eslint-disable-next-line require-jsdoc
export function removeUndefined<T>(obj: T): T {
  if (obj === undefined) {
    return obj;
  }
  const acc: Partial<T> = {};
  for (const key in obj) {
    if (obj[key] !== undefined) acc[key] = obj[key];
  }
  return acc as T;
}
