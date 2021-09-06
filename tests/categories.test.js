const { expect } = require('chai')
const sinon = require('sinon')
const { getCategories, addCategories, updateCategories, getItemsByCategories, deleteCategories } = require('../src/controllers/categories')

describe('Categories: Get Categories testing', () => {
  it('List of all categories!', (done) => {

    let req = {}

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('List of categories')
      done()
    }).catch((err) => {
      done(err)
    })
  })
  it('You must input name categories!', (done) => {
    let req = {
      body: {
        name: ''
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    addCategories(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(400)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('You must input name categories!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Create Category successfully!', (done) => {
    let req = {
      body: {
        name: 'Desert'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    addCategories(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('Create categories has been successfully!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Update categories not found!', (done) => {

    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 6
      },
      body: {
        name: 'Fish'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    updateCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(404)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Categories not found!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Update categories successfully!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 5
      },
      body: {
        name: 'Fish'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    updateCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal(`Categeories updated successfully!`)
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Get nothing items by category !', (done) => {
    let req = {
      params: {
        id: 6
      },
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getItemsByCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(400)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal(`Sorry items is nothing`)
      done()
    }).catch((err) => {
      done(err)
    })
  })
  it('Get list items by category !', (done) => {
    let req = {
      params: {
        id: 3
      },
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getItemsByCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal(`List item by category!`)
      done()
    }).catch((err) => {
      done(err)
    })

    
  })
  it('Delete with nothing id category!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 39
      },
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    deleteCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(404)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal(`categories not found!`)
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Delete category success!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 51
      },
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    deleteCategories(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal(`categories has been deleted!`)
      done()
    }).catch((err) => {
      done(err)
    })
  })

})