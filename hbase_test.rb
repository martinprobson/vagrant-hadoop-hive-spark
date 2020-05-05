create 'testtable', 'colfam1', { SPLITS => ['row-300', 'row-500', 'row-700', 'row-900'] }
for i in '0' .. '9' do for j in '0'..'9' do for k in '0'..'9' do put 'testtable', "row-#{i}#{j}#{k}", "colfam1:#{j}#{k}", "#{j}#{k}" end end end
flush 'testtable'
for i in '0' .. '9' do for j in '0'..'9' do for k in '0'..'9' do put 'testtable', "row-#{i}#{j}#{k}", "colfam1:#{j}#{k}", "#{j}#{k}" end end end

