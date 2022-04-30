import { index, hello } from '../routes/default.js';

describe('Test Handlers', function () {

    // positive test
    test('responds to /', () => {
        const req = {  };
        const res = { text: '',
            send: function(input) { this.text = input } 
        };
        index(req, res)
        
        expect(res.text).toEqual('hello remote world!');
    });

    // positive test
    test('responds to /hello/:name', () => {
        const req = { params: { name: 'Bob' }  };
        const res = { text: '',
            send: function(input) { this.text = input } 
        };
        hello(req, res)
        
        expect(res.text).toEqual('hello Bob!');
    });

    // negative test
    test('responds to /', () => {
        const req = {  };
        const res = { text: '',
            send: function(input) { this.text = input } 
        };
        index(req, res)
        
        expect(res.text).not.toEqual('hello world!');
    });

});
