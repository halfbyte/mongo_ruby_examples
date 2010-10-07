namespace :examples do
  desc "run all examples"
  task :run do
    Dir['*_examples.rb'].each do |f|
      puts "-----------> #{f}"
      sh("ruby -Ilib #{f}")
    end
  end
 end



namespace :servers do
  desc "run a single mongod server"
  task :simple do
    sh("mkdir -p data")
    sh("mongod --dbpath data")
  end
  desc "run a master slave pair"
  task :master_slave do
    dir = Dir.getwd
    sh("mkdir -p master_slave/data/m master_slave/data/s")
    sh("mongod --master --dbpath #{dir}/master_slave/data/m --port 27017 --fork --logpath master_slave/master.log")
    sh("mongod --slave --source localhost:27017 --dbpath #{dir}/master_slave/data/s --port 27018 --fork --logpath master_slave/slave.log")
    sh("tail -f master_slave/*.log")
    sh("killall mongod")
  end

  task :replicasets do
    dir = Dir.getwd
    sh("mkdir -p replicasets/data/r0 replicasets/data/r1 replicasets/data/r2")
    sh("mongod --replSet foo --dbpath #{dir}/replicasets/data/r0 --port 27017 --fork --logpath #{dir}/replicasets/r0.log")
    sh("mongod --replSet foo --dbpath #{dir}/replicasets/data/r1 --port 27018 --fork --logpath #{dir}/replicasets/r1.log")
    sh("mongod --replSet foo --dbpath #{dir}/replicasets/data/r2 --port 27019 --fork --logpath #{dir}/replicasets/r2.log")
    puts "remember to run 'mongo -p 27017 #{dir}/init_replicaset.js' if you are creating the dbs for the first time"
    system("tail -f replicasets/*.log")
    # todo need to setup replica sets here!
    sh("killall mongod")
  end
  task :sharding do
    dir = Dir.getwd
    sh("mkdir -p sharding/data/s0 sharding/data/s1 sharding/data/config")
    sh("mongod --shardsvr --dbpath #{dir}/sharding/data/s0 --port 27018 --fork --logpath #{dir}/sharding/s0.log")
    sh("mongod --shardsvr --dbpath #{dir}/sharding/data/s1 --port 27019 --fork --logpath #{dir}/sharding/s1.log")
    sh("mongod --configsvr --dbpath #{dir}/sharding/data/config --port 27020 --fork --logpath #{dir}/sharding/config.log")
    sh("mongos --configdb localhost:27020 --fork --logpath #{dir}/sharding/shard.log")
    system("tail -f sharding/*.log")
    sh("killall mongod")
    sh("killall mongos")
  end

  
  desc "kill all databases"
  task :kill do
    sh("killall mongod")
    sh("killall mongos")
  end
  
  desc "remove datafiles" 
  task :clean do
    sh("rm -rf sharding/data/s0 sharding/data/s1 sharding/data/config")
    sh("rm -rf replicasets/data/r0 replicasets/data/r1 replicasets/data/r2")
    sh("rm -rf master_slave/data/m master_slave/data/s")
    sh("rm -rf data")
  end
  
  
end