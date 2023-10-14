import { useBackend } from '../backend';
import { Button, NoticeBox, Section, Box } from '../components';
import { Window } from '../layouts';

export const Autodoc = (props, context) => {
  const { act, data } = useBackend(context);
  const operations = data.surgeries;
  if (data.mode === 1) {
    return (
      <Window width={496} height={440}>
        <Section title="Limbs">
          <Button
            key="head"
            content="Head"
            onClick={() => act('target', { part: 'head' })}
          />
          <Button
            key="chest"
            content="Chest"
            onClick={() => act('target', { part: 'chest' })}
          />
          <Button
            key="l_arm"
            content="L. Arm"
            onClick={() => act('target', { part: 'l_arm' })}
          />
          <Button
            key="r_arm"
            content="R. Arm"
            onClick={() => act('target', { part: 'r_arm' })}
          />
          <Button
            key="l_leg"
            content="L. Leg"
            onClick={() => act('target', { part: 'l_leg' })}
          />
          <Button
            key="r_leg"
            content="R. Leg"
            onClick={() => act('target', { part: 'r_leg' })}
          />
          <Button
            key="groin"
            content="Groin"
            onClick={() => act('target', { part: 'groin' })}
          />
          <Button
            key="eyes"
            content="Eyes"
            onClick={() => act('target', { part: 'eyes' })}
          />
          <Button
            key="mouth"
            content="Mouth"
            onClick={() => act('target', { part: 'mouth' })}
          />
        </Section>
        <Section>
          {operations.map((op) => (
            <Button
              icon="vial"
              key={op.name}
              content={op.name}
              selected={op.selected}
              onClick={() => act('surgery', { path: op.path })}
            />
          ))}
        </Section>
        <Section>
          <Button
            key="start_op"
            content="Start Operation"
            onClick={() => act('start')}
          />
        </Section>
      </Window>
    );
  } else if (data.mode === 2) {
    return (
      <Window>
        <Section textAlign="center" title={'Operation: ' + data.s_name}>
          {data.steps.map((step) => (
            <Box key={step.name} fontSize={step.current ? '16px' : '12px'}>
              {step.current ? '>> ' : ''}
              {step.name}
              {step.current ? ' <<' : ''}
            </Box>
          ))}
        </Section>
        <NoticeBox textAlign="center">Surgery Module Active</NoticeBox>
      </Window>
    );
  } else {
    return <NoticeBox textAlign="center">Access Restricted</NoticeBox>;
  }
};