package myproject.convert;

import myproject.entity.InformationssEntity;
import myproject.vo.InformationssVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
* 资料
*
*/
@Mapper
public interface InformationssConvert {
    InformationssConvert INSTANCE = Mappers.getMapper(InformationssConvert.class);

    InformationssEntity convert(InformationssVO vo);

    InformationssVO convert(InformationssEntity entity);

    List<InformationssVO> convertList(List<InformationssEntity> list);

    List<InformationssEntity> convertEntityList(List<InformationssVO> list);
}