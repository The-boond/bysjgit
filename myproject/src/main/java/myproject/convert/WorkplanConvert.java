package myproject.convert;

import myproject.entity.WorkplanEntity;
import myproject.vo.WorkplanVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 工作计划
*
*/
@Mapper
public interface WorkplanConvert {
    WorkplanConvert INSTANCE = Mappers.getMapper(WorkplanConvert.class);

    WorkplanEntity convert(WorkplanVO vo);

    WorkplanVO convert(WorkplanEntity entity);

    List<WorkplanVO> convertList(List<WorkplanEntity> list);

    List<WorkplanEntity> convertEntityList(List<WorkplanVO> list);
}