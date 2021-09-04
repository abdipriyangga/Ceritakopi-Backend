const {expect} = require('chai')
const sinon = require('sinon')
const {login, signup} = require('../src/controllers/auth')

describe('Auth: Login testing', ()=>{
  it('email not found!', (done)=>{

    let req = {
      body: {
        email: 'dummy8@gmail.com',
        password: '123456'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    login(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(404)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('email not found!')
      done()
    }).catch((err) => {
      console.log(err);
    })
  })

  it('Wrong email or password!', (done) => {

    let req = {
      body: {
        email: 'dummy2@gmail.com',
        password: '1234564'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    login(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(401)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Wrong email or password!')
      done()
    }).catch((err) => {
      done(err);
    })
  })

  it('Login Success!', (done) => {

    let req = {
      body: {
        email: 'dummy2@gmail.com',
        password: '123456'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    login(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('Login Success!')
      done()
    }).catch((err) => {
      console.log(err);
    })
  })
})


describe('Auth: Register function: ', () => {
  it('email already exist!', () => {

    let req = {
      body: {
        email: 'dummy6@gmail.com',
        password: '123456',
        phone_number: '081211223345'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    signup(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(401)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Email already exist!')
    }).catch((err) => {
      console.log(err);
    })
  })

  it('Phone number already exist!', () => {

    let req = {
      body: {
        email: 'dummy7@gmail.com',
        password: '1234564',
        phone_number: '081211223345'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    signup(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(401)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Phone number already exist!')
    }).catch((err) => {
      console.log(err);
    })
  })

  it('Email is not valid!', () => {
    let req = {
      body: {
        email: 'dummy7',
        password: '123456',
        phone_number: '081211223355'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }
    
    const res = mockingResponse()


    signup(req, res).then((data) => {
      // console.log("data: ", data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(401)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Email is not valid!')
    }).catch((err) => {
      console.log(err);
    })
  })
})
