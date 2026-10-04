
function write_springs_cmm(outDir,fileName,r1,r2,r)

[~,name]=fileparts(fileName);
name = strrep(name,'_',' ');

chimera_cmm = {'<marker_sets>',sprintf('<marker_set name="%s">',name)};

for j=1:size(r1,1)
    id1 = (j-1)*2 + 1;
    id2 = id1 + 1;
    marker_fmt = '<marker id="%d" x="%g" y="%g" z="%g" radius="%g"/>';
    link_fmt = '<link id1="%d" id2="%d" radius="%g"/>';
    chimera_cmm = [chimera_cmm,...
        {sprintf(marker_fmt,id1,r1(j,1),r1(j,2),r1(j,3),r),...
         sprintf(marker_fmt,id2,r2(j,1),r2(j,2),r2(j,3),r),...
         sprintf(link_fmt,id1,id2,r)}];
end
    chimera_cmm = [chimera_cmm,{'</marker_set>','</marker_sets>'}];

fid = fopen(fullfile(outDir,fileName),'w');
    fprintf(fid,'%s\n',chimera_cmm{:});
    fclose(fid);

end