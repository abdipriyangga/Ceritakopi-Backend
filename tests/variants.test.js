const { expect } = require('chai')
const sinon = require('sinon')
const { getVariants, addVariants, getDetailVariants, updateVariants, deleteVariants } = require('../src/controllers/variants')


describe('Variants: Get Variant testing', () => {
  it('List of all variants!', (done) => {

    let req = {}

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getVariants(req, res).then((data) => {
      // console.log('data: ', data.json.firstCall.args[0]);
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('List of variants')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('You must input name and code variants!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      body: {
        name: '',
        code: ''
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    addVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(400)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('You must input name and code variants!')
      done()
    }).catch((err) => {
      done(err)
    })
  })
  it('Add variant: An error occured!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      body: {}
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    addVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(500)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('An error occured!')
      done()
    }).catch((err) => {
      done(err)
    })
  })
  // it('Create variants has been successfully!', (done) => {
  //   let req = {
  //     authUser: {
  //       id: 2
  //     },
  //     body: {
  //       name: 'Super nendang',
  //       code: 'SN'
  //     }
  //   }

  //   const mockingResponse = () => {
  //     const res = {}
  //     res.status = sinon.stub().returns(res)
  //     res.json = sinon.stub().returns(res)
  //     return res
  //   }

  //   const res = mockingResponse()

  //   addVariants(req, res).then((data) => {
  //     expect(data.status.firstCall.args[0]).equal(200)
  //     expect(data.json.firstCall.args[0].success).to.be.true
  //     expect(data.json.firstCall.args[0].message).equal('Create variants has been successfully!')
  //     done()
  //   }).catch((err) => {
  //     done(err)
  //   })
  // })

  it('Get detail variant', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 3
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getDetailVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('Detail variants')
      done()
    }).catch((err) => {
      done(err)
    })
  })


  it('Get detail variant: Not found!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 25
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    getDetailVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(404)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Variant not Found!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Update variant: with id variant not found!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 17
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    updateVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(404)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('Variants not found!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Update variant: variant update success!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 5
      },
      body: {
        name: 'Super Nendang Abis',
        code: 'SNA'
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    updateVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('Variant updated successfully!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Delete variant: variant delete not found!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 13
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    deleteVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(404)
      expect(data.json.firstCall.args[0].success).to.be.false
      expect(data.json.firstCall.args[0].message).equal('variant not found!')
      done()
    }).catch((err) => {
      done(err)
    })
  })

  it('Delete variant: variant delete success!', (done) => {
    let req = {
      authUser: {
        id: 2
      },
      params: {
        id: 9
      }
    }

    const mockingResponse = () => {
      const res = {}
      res.status = sinon.stub().returns(res)
      res.json = sinon.stub().returns(res)
      return res
    }

    const res = mockingResponse()

    deleteVariants(req, res).then((data) => {
      expect(data.status.firstCall.args[0]).equal(200)
      expect(data.json.firstCall.args[0].success).to.be.true
      expect(data.json.firstCall.args[0].message).equal('variant has been deleted!')
      done()
    }).catch((err) => {
      done(err)
    })
  })
})