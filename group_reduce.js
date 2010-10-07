// reduce() for group
function(doc, prev) {
  for(i in doc.tags) {
    if (doc.tags[i] in prev.tags) {
      prev.tags[doc.tags[i]]++
    } else {
      prev.tags[doc.tags[i]] =1
    }
  }
}

// finalize() for group
function(prev) {
  var mostPopular = 0; 
  for(i in prev.tags) {
    if(prev.tags[i] > mostPopular) {
      prev.tag = i; 
      prev.count = prev.tags[i];
      mostPopular = prev.tags[i];
    }
  } 
  delete prev.tags
}

// map() for map/reduce
function() {
  this.tags.forEach(function(z) {
    emit(z, {count: 1});
  });
}
// reduce() for map/reduce
function(key, values) {
  var total = 0;
  values.forEach(function(v) { total += v.count });
  return {count: total}
}
