import { hello } from './hello';

describe('hello tests', () => {
    it('should say hi once in a while :(', () => {
        expect(hello()).toEqual('hello');
    });
});