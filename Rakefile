namespace :examples do
  desc "run all examples"
  task :run do
    Dir['*.rb'].each do |f|
      puts "-----------> #{f}"
      system("ruby -Ilib #{f}")
    end
  end
 end

namespace :servers do
  desc "run a single mongod server"
  task :simple do
    system("mongod --dbpath data")
  end
  desc "run a master slave pair"
  task :master_slave do
    dir = Dir.getwd
    system("mkdir -p master_slave/data/m master_slave/data/s")
    system("mongod --master --dbpath #{dir}/master_slave/data/m --port 27017 --fork --logpath master_slave/master.log")
    system("mongod --slave --source localhost:27017 --dbpath #{dir}/master_slave/data/s --port 27018 --fork --logpath master_slave/slave.log")
    system("tail -f master_slave/*.log")
    system("killall mongod")
  end

  task :replicasets do
    dir = Dir.getwd
    system("mkdir -p replicasets/data/r0 replicasets/data/r1 replicasets/data/r2")
    system("mongod --replSet foo --dbpath #{dir}/replicasets/data/r0 --port 27017 --fork --logpath #{dir}/replicasets/r0.log")
    system("mongod --replSet foo --dbpath #{dir}/replicasets/data/r1 --port 27018 --fork --logpath #{dir}/replicasets/r1.log")
    system("mongod --replSet foo --dbpath #{dir}/replicasets/data/r2 --port 27019 --fork --logpath #{dir}/replicasets/r2.log")
    system("tail -f replicasets/*.log")
    system("killall mongod")
  end
  task :sharding do
    dir = Dir.getwd
    system("mkdir -p sharding/data/s0 sharding/data/s1 sharding/data/config")
    system("mongod --shardsvr --dbpath #{dir}/sharding/data/s0 --port 27018 --fork --logpath #{dir}/sharding/s0.log")
    system("mongod --shardsvr --dbpath #{dir}/sharding/data/s1 --port 27019 --fork --logpath #{dir}/sharding/s1.log")
    system("mongod --configsvr --dbpath #{dir}/sharding/data/config --port 27020 --fork --logpath #{dir}/sharding/config.log")
    system("mongos --configdb localhost:27020 --fork --logpath #{dir}/sharding/shard.log")
    system("tail -f sharding/*.log")
    system("killall mongod")
    system("killall mongos")
  end

  
  desc "kill all databases"
  task :kill do
    system("killall mongod")
    system("killall mongos")
  end
  
  
  
end