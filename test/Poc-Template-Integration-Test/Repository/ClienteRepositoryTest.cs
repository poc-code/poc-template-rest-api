﻿using Poc_Template_Core_Test.Mock;
using Poc_Template_Domain.Entities;
using Poc_Template_Infra.Repository;
using Xunit;

namespace Poc_Template_Integration_Test.Repository
{
    public class ClienteRepositoryTest : BaseRepositoryTest<Cliente>
    {
        private ClienteRepository _repository;

        public ClienteRepositoryTest() : base(ClienteMock.ClienteFaker.Generate(10))
        {
            _repository = new ClienteRepository(EntityContextMock, DapperContextMock);
        }

        [Fact]
        public void Crud_Success_Test()
        {
            _repository.Add(FirstData);
            var IsSave = UnitOfWorkMock.Commit();

            _repository.Update(FirstData);
            var IsUpdate = UnitOfWorkMock.Commit();

            _repository.Remove(FirstData);
            var IsRemove = UnitOfWorkMock.Commit();

            Assert.Equal(1, IsSave);
            Assert.Equal(1, IsUpdate);
            Assert.Equal(1, IsRemove);
        }

        [Fact]
        public void BuscarTodosAsync_Successo()
        {
            var rs = _repository.BuscarTodosAsync();
            Assert.NotNull(rs);
        }

        [Fact]
        public void GetByIdAsync_Sucesso()
        {
            var rs = _repository.GetByIdAsync(1);
            Assert.NotNull(rs);
        }
    }
}
