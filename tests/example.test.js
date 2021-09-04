const assert = require('assert')
// const {expect, should} = require('chai')
const should = require('chai').should()

const greetings = 'Hello World'

describe('This is example test: ', ()=>{
  it('greeting type variable should be string', () => {
    greetings.should.be.a.string
  })

  it('greeting variable value should be Hello World', ()=>{
    // assert.equal(2+2, 4)
    // expect(true).to.be.equal(true)
    greetings.should.to.be.equal('Hello World')
  })
})