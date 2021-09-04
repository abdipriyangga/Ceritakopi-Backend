const { expect } = require('chai')
const sinon = require('sinon')
const { getCategories } = require('../src/controllers/categories')

describe('Categories: Get Categories testing', () => {
  it('error occured!', () => {

    let req = {}

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getCategories(req, res)
    console.log('data: ', res.json.firstCall );
    // expect(data.status.firstCall.args[0]).equal(404)
    // expect(data.json.firstCall.args[0].success).to.be.false
    // expect(data.json.firstCall.args[0].message).equal('email not found!')
  })

})