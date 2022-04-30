
import request from 'supertest';
import express from 'express';
import router from '../routes/main.js';

const app = new express();
app.use('/', router);

describe('Good Home Routes', function () {

  // positive test
  test('responds to /', async () => {
    const res = await request(app).get('/');
    expect(res.header['content-type']).toBe('text/html; charset=utf-8');
    expect(res.statusCode).toBe(200);
    expect(res.text).toEqual('hello remote world!');
  });
  
  // positive test
  test('responds to /hello/:name', async () => {
    const res = await request(app).get('/hello/Vandy'); 
    expect(res.header['content-type']).toBe('text/html; charset=utf-8');
    expect(res.statusCode).toBe(200);
    expect(res.text).toEqual('hello Vandy!');
  });

  // negative test
  test('responds to /hello/Vandy', async () => {
    const res = await request(app).get('/hello/Vandy'); 
    expect(res.header['content-type']).toBe('text/html; charset=utf-8');
    expect(res.statusCode).toBe(200);
    expect(res.text).not.toEqual('hello Annie!');
  });

});