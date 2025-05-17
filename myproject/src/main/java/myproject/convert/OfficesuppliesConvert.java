package myproject.convert;

import myproject.entity.OfficesuppliesEntity;
import myproject.vo.OfficesuppliesVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 办公用品
*
*/
@Mapper
public interface OfficesuppliesConvert {
    OfficesuppliesConvert INSTANCE = Mappers.getMapper(OfficesuppliesConvert.class);

    OfficesuppliesEntity convert(OfficesuppliesVO vo);

    OfficesuppliesVO convert(OfficesuppliesEntity entity);

    List<OfficesuppliesVO> convertList(List<OfficesuppliesEntity> list);

    List<OfficesuppliesEntity> convertEntityList(List<OfficesuppliesVO> list);
}